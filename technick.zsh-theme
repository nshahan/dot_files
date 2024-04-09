NEWLINE=$'\n'
ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f "
PROMPT='%B┌─[%F{green}%m%f $(git_prompt_info)%F{blue}%~%f]${NEWLINE}└─■ %b'