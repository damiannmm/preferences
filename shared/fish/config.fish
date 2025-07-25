if status is-interactive
    # Commands to run in interactive sessions can go here
end


# setup PATH
# set __prepend_path foo_1
# set -a __prepend_path bar_1

set __append_path /usr/local/opt/mysql-client/bin
set -a __append_path /Users/damiann/Library/Python/3.9/bin

# set PATH $__prepend_path $PATH
set PATH $PATH $__append_path

# set -e __prepend_path
set -e __append_path

# # variables
# function __prompt_icon
#     set bg_col $argv
#     set_color -b $bg_col
#     echo -n ' $ '
#     set_color $bg_col -b normal
#     echo -n ''
#     set_color normal
# end
# set tide_character_icon (__prompt_icon black)

# set -x EDITOR 'nvim'

# set -x GPG_TTY (tty)

# set -x LC_ALL 'en_US.UTF-8'
# set -x LANG 'en_US.UTF-8'

# set -x LS_COLORS 'ow=01;36'

# set -x LESS_TERMCAP_mb \e\[1\x3B32m
# set -x LESS_TERMCAP_md \e\[1\x3B32m
# set -x LESS_TERMCAP_me \e\[0m
# set -x LESS_TERMCAP_se \e\[0m
# set -x LESS_TERMCAP_so \e\[01\x3B33m
# set -x LESS_TERMCAP_ue \e\[0m
# set -x LESS_TERMCAP_us \e\[1\x3B4\x3B31m

# set -x unamer (uname -r)


# aliases and functions
# switch (uname)
#     case Darwin
#         alias _pwd /bin/pwd
#         alias _ls /bin/ls
#     case Linux
#         alias _pwd /usr/bin/pwd
#         alias _ls '/usr/bin/ls --color'

#         if string match -q '*WSL*' (uname -r)
#             alias pbpaste 'win32yank -o'
#             alias pbcopy 'win32yank -i'
#         end
# end

# alias ls '_ls -FG'
# alias ll 'ls -hloAF'
# alias la 'ls -A'

# alias vi 'nvim'
# alias vim 'nvim'

# function gxx --argument-names "opt" "filename"
#     g++ $filename

#     if [ "$opt" = "r" ]
#         time ./a.out
#     else if [ "$opt" = "i" ]
#         time ./a.out < input.txt
#     else if [ "$opt" = "io" ]
#         time ./a.out < input.txt > output.txt
#     end
# end

function __pwd
    builtin pwd -L
    if [ (builtin pwd -L) != (builtin pwd -P) ]
        builtin pwd -P
    end
end
alias pwd '__pwd'

function __cd
    set tmpdir $dirprev
    set -g dirprev (__pwd)
    if [ "$argv" = "-" ]
        builtin cd $tmpdir
    else
        builtin cd $argv
    end
    if [ (command ls | wc -l) -le 16 ]
        ls
    end
end
alias cd '__cd'


function __git
    if [ "$argv" = "log" ]
        command git $argv --all --decorate --oneline --graph --date=relative --format="%C(auto)%h %d %s - %C(blue)%ad%Creset <%C(bold green)%ae%Creset>"
    else
        command git $argv
    end
end
alias git '__git'


# # bindings
# bind ! __history_previous_command
# bind '$' __history_previous_command_arguments
# bind -k nul complete
# bind \t accept-autosuggestion
