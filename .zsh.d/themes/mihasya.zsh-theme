# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
local ret_status="%(?:%{$fg_bold[green]%}😀 :%{$fg_bold[red]%}😡 %s)
$ %{$reset_color%}"

PROMPT='[ %* %{$fg_bold[green]%}%p%{$fg[cyan]%}%0d%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}] ${ret_status}% '

ZSH_THEME_GIT_PROMPT_PREFIX=" git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
