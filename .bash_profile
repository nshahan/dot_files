export CLICOLOR=1
export TERM=xterm-256color
export EDITOR=vim

# Git prompt and auto-completion.
source ~/.git-completion.bash
source ~/.git-prompt.sh

PS1='\[\e[1m\]┌─[\[\e[32m\]\h\[\e[39m\]:\[\e[35m\]$(__git_ps1 " (%s)") \[\e[34m\]\w\[\e[39m\]]
└─■ \[\e[0m\]'

# keep pressing tab to cycle through autocompletes
#bind '"\t":menu-complete'

# Pub cache
export PATH=$HOME/.pub-cache/bin:$PATH

# Homebrew stuff
export PATH=$HOME/homebrew/bin:$PATH
export LD_LIBRARY_PATH=$HOME/homebrew/lib:$LD_LIBRARY_PATH

# Chrome depot tools
export PATH=$HOME/code/depot_tools:$PATH

# Local Flutter checkout
#export PATH=$HOME/code/flutter/flutter/bin:$PATH

# Dart SDK built from source.
#export PATH=$HOME/code/dart-sdk/sdk/xcodebuild/ReleaseX64/dart-sdk/bin:$PATH

# NNBD Dart SDK built from source.
#export PATH=$HOME/code/dart-sdk/sdk/xcodebuild/ReleaseX64NNBD/dart-sdk/bin:$PATH

# Dart SDK downloaded from the web.
#export PATH=$HOME/Downloads/dart-sdk/bin:$PATH

# Aliases
alias pbr="pub run build_runner"
alias gg="git log --graph --oneline --branches"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# fzf plugin
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

