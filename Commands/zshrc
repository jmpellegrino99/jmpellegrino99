<<<<<<< HEAD
# Other aliases and configurations
=======
# Force color prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='%F{green}%n@%m%f:%F{blue}%~%f\$ '
else
    PS1='%n@%m:%~\$ '
fi

# Unset color_prompt and force_color_prompt
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="%{\e]0;%n@%m: %~\a%}$PS1"
    ;;
*)
    ;;
esac

# Enable color support for ls and add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

export GREP_OPTIONS='--color=auto'

>>>>>>> 045242b6d7cc46cd13df0089974dae5b3514bbb5
alias bl='system_profiler SPBluetoothDataType'
alias c='clear'
alias clear_downloads='rm -rf ~/Downloads/*'
alias copy_apps="ls /Applications > ~/Scripts/applications.txt; sed -i '' 's/\.app//g' ~/Scripts/applications.txt"
alias e='exit'
alias empty_trash='rm -r ~/.Trash/*'
alias fox='python3 ~/Github/linux-swashbuckling/fox.py'
alias gitpull='source ~/Github/gitpull.sh'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias l='ls'
alias lsl='ls -lhS'
alias publicip='curl ifconfig.me'
alias reset_launchpad='defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock'
alias size='du -sh'
alias text='open -a TextEdit'
alias tr='trans -b'
alias zip='zip -e'
alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0'
