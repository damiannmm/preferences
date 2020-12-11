# variables
set tide_prompt_char_icon ' $ ❯'
set tide_pwd_truncate_margin 1024

set -x EDITOR 'subl -w'

set -x LC_ALL 'en_US.UTF-8'
set -x LANG 'en_US.UTF-8'


# aliases and functions
alias ll 'ls -hloAF'
alias la 'ls -A'

alias vi 'nvim'
alias vim 'nvim'

function __cd
    set tmpdir $dirprev
    set -g dirprev (pwd)
    if [ "$argv" = "-" ]
        builtin cd $tmpdir
    else
        builtin cd $argv
    end
    if [ (ls | wc -l) -le 16 ]
        /bin/ls -FG
    end
end
alias cd '__cd'

function __pwd
    /bin/pwd
    if [ (/bin/pwd) != (/bin/pwd -P) ]
        /bin/pwd -P
    end
end
alias pwd '__pwd'

function __man
    /usr/bin/man $argv | col -b | subl -w &
end
alias man '__man'

function __git
    if [ "$argv" = "log" ]
        /usr/local/bin/hub $argv --all --decorate --oneline --graph
    else
        /usr/local/bin/hub $argv
    end
end
alias git '__git'


# bindings
bind ! __history_previous_command
bind '$' __history_previous_command_arguments


# iterm2 integration
# test -e /Users/damiann/.iterm2_shell_integration.fish ; and source /Users/damiann/.iterm2_shell_integration.fish ; or true
