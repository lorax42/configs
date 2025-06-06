### ALIASES
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

if [[ $(which lsd) ]]; then
    ls="lsd"
else
    ls="ls"
fi

alias ls="$ls"
alias l="$ls --group-directories-first"
alias ll="$ls -lh --group-directories-first"
alias la="$ls -A --group-directories-first"
#alias la="$ls -1sha --group-directories-first"
alias lla="$ls -lhA --group-directories-first"

# alias update="sudo apt update && sudo apt upgrade -y && flatpak update -y && sudo apt autoremove -y && sudo apt autoclean && rustup update"
update () {
    echo "### SYSTEM PACKAGES ###"
    sudo apt update && sudo apt uppgrade -y
    sudo apt autoremove -y sudo apt autoclean
    
    echo ""
    echo "### FLATPAK ###"
    flatpak update -y

    echo ""
    echo "### RUST TOOLCHAIN ###"
    rustup update
}

alias rm="rm -I"
alias cp="cp -i"
alias mv="mv -i"

if [[ $(which nvim) ]]; then
    alias v="nvim"
fi

if [[ $(which python3) ]]; then
    alias py="python3"
fi

if [[ $(which batcat) ]]; then
    alias bat="batcat"
fi

if [[ $(which git) ]]; then
    alias gs="echo 'using alias gs' && git status"
    alias ga="echo 'using alias ga' && git add "
    alias gaa="echo 'using alias gaa' && git add ."
    alias gc="echo 'using alias gc' && git commit"
    alias gcm="echo 'using alias gcm' && git commit -m "
    alias gp="echo 'using alias gp' && git pull"
    alias gP="echo 'using alias gP' && git push"
fi

if [[ $(which yazi) ]]; then
    alias y="yazi"
fi

if [[ $(flatpak run org.getzola.zola  --version 2> /dev/null) ]]; then
    alias zola="flatpak run org.getzola.zola"
fi
 
# WINDOWS C/C++
alias wingcc="x86_64-w64-mingw32-gcc"
alias wing++="x86_64-w64-mingw32-g++"

