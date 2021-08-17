#source /Users/wongyen/.bash_profile
alias rm="rm -i"

#terminal color setting
#export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS='ExGxFxdaCxDaDahbadacec'
#PATH setting
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/Racket v8.1/bin:$PATH"
export PATH="/Users/wongyen/Software/platform-tools/:$PATH"


#load git complete
zstyle ':completion:*:*:git:*' script /Users/wongyen/Downloads/git-2.31.1/contrib/completion/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

#set proxy
export all_proxy="socks5://127.0.0.1:7890"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
