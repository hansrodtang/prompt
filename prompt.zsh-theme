local ret_status="%(?::%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p%{$fg[cyan]%}%c %{$reset_color%}'
RPROMPT="\$(git-radar --zsh --fetch) "
Export GIT_RADAR_COLOR_BRANCH="$fg_bold[blue]"
