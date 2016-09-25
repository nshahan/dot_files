export CLICOLOR=1
export TERM=xterm-256color
PS1="┌─[\[\e[35m\]\u@\h\[\e[0m\]: \[\e[32m\]\w\[\e[0m\]]\n└─■ "

# keep pressing tab to cycle through autocompletes
bind '"\t":menu-complete'