setopt prompt_subst

zmodload zsh/zle
autoload -Uz add-zsh-hook
autoload -Uz async && async

add-zsh-hook precmd prompt_precmd

local ret_status="%(?::%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p%{$fg[cyan]%}%c %{$reset_color%}'
RPROMPT=''

function prompt_async() {
	builtin cd -q "$*"
	git-radar --zsh --fetch
}

function prompt_callback() {
	RPROMPT=$3
	zle && zle reset-prompt
}

function prompt_precmd() {
	async_start_worker prompt_worker -n
	async_register_callback prompt_worker prompt_callback
	async_job prompt_worker prompt_async "$(pwd)"
}
