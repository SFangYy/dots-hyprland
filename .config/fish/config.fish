function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

starship init fish | source
if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
end

alias pamcan pacman
alias ls 'eza --icons'
alias clear "printf '\033[2J\033[3J\033[1;1H'"
alias q 'qs -c ii'
alias z cd
alias c clear
alias vim nvim
alias update 'sudo pacman -Syu'
alias cdw 'cd ~/work'
alias cdn 'cd ~/work/Notes'
alias tn 'tmux new -s'
alias tl 'tmux list-sessions'
alias ta 'tmux attach-session'
alias sk 'ssh songfangyuan@172.28.9.101'
alias sf 'ssh sfangyy@192.168.41.122'
set -gx GEMINI_API_KEY AIzaSyDuSjzoFV16HO-pCrrgrpHgjK2ncRO5wPA
#set -gx VCS_HOME "/home/sfangyy/work/9-dependency/synopsys/vcs/W-2024.09-SP1"
#set -gx PATH "$VCS_HOME/bin" $PATH
#set -gx VCS_ARCH_OVERRIDE linux

set -gx EDA_HOME /home/sfangyy/work/9-dependency/EDAWorkbench

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end
