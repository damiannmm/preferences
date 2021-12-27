if status is-interactive
    # Commands to run in interactive sessions can go here
end


# setup PATH
# set __prepend_path foo_1
# set -a __prepend_path bar_1

# set __append_path foo_2
# set -a __append_path bar_2

# set PATH $__prepend_path $PATH $__prepend_path

# set -e __prepend_path
# set -e __append_path

# variables
# function __prompt_icon
#     set bg_col $argv
#     set_color -b $bg_col
#     echo -n ' $ '
#     set_color $bg_col -b normal
#     echo -n ''
#     set_color normal
# end
# set tide_prompt_char_icon (__prompt_icon black)

# set tide_pwd_truncate_margin 1024

set -x EDITOR 'nvim'

#set -x MANPAGER 'nvim +Man!'
#set -x MANWIDTH 999

set -x LC_ALL 'en_US.UTF-8'
set -x LANG 'en_US.UTF-8'

set -x LS_COLORS 'ow=01;36'

set -Ux LESS_TERMCAP_mb \e\[1\x3B32m
set -Ux LESS_TERMCAP_md \e\[1\x3B32m
set -Ux LESS_TERMCAP_me \e\[0m
set -Ux LESS_TERMCAP_se \e\[0m
set -Ux LESS_TERMCAP_so \e\[01\x3B33m
set -Ux LESS_TERMCAP_ue \e\[0m
set -Ux LESS_TERMCAP_us \e\[1\x3B4\x3B31m


# aliases and functions
alias ls 'ls -FG --color'
alias ll 'ls -hloAF'
alias la 'ls -A'

alias pbpaste 'powershell.exe Get-Clipboard'
alias pbcopy 'clip.exe'

alias vi 'nvim'
alias vim 'nvim'

function gxx --argument-names "opt" "filename"
    g++ $filename

    if [ "$opt" = "r" ]
        time ./a.out
    else if [ "$opt" = "i" ]
        time ./a.out < in.txt
    else if [ "$opt" = "io" ]
        time ./a.out < in.txt > out.txt
    end
end

function __cd
    set tmpdir $dirprev
    set -g dirprev $PWD
    if [ "$argv" = "-" ]
        builtin cd $tmpdir
    else
        builtin cd $argv
    end
    if [ (/usr/bin/ls | wc -l) -le 16 ]
        /usr/bin/ls -FG --color
    end
end
alias cd '__cd'

function __pwd
    /usr/bin/pwd -L
    if [ (/usr/bin/pwd -L) != (/bin/pwd -P) ]
        /usr/bin/pwd -P
    end
end
alias pwd '__pwd'

function __man
    if [ (count $argv) = 1 ]
        /usr/bin/man $argv > $argv
        subl $argv
        mv $argv /tmp/man/$argv.txt
    else
        /usr/bin/man $argv
    end
end
# alias man '__man'

function __git
    if [ "$argv" = "log" ]
        /usr/bin/hub $argv --all --decorate --oneline --graph
    else
        /usr/bin/hub $argv
    end
end
alias git '__git'


# bindings
bind ! __history_previous_command
bind '$' __history_previous_command_arguments
bind -k nul complete
bind \t accept-autosuggestion
