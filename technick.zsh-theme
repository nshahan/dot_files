NEWLINE=$'\n'
ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%F{white} "
PROMPT='%F{white}%B┌─[%F{green}%m%F{white} $(git_prompt_info)%F{blue}%~%F{white}]${NEWLINE}└─■ %b'