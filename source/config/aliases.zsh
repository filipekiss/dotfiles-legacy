# Aliases
alias artisan="php artisan"
alias cp="${aliases[cp]:-cp} -i"
alias ll="${aliases[ll]:-ll} -v"
alias ln="${aliases[ln]:-ln} -i"
alias ls="${aliases[ls]:-ls} -v"
alias la="${aliases[la]:-ls} -la"
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias mv="${aliases[mv]:-mv} -i"
alias phplint='find . -name "*.php" -exec php -l {} \; | grep "error"'
alias ping="ping -c 4"
alias pubkey='cat $HOME/.ssh/id_rsa.pub'
alias rm="${aliases[rm]:-rm} -i"
alias rsync="rsync -rpltDv"
alias server="sudo python -m SimpleHTTPServer 80"
alias type='type -a'

# File Download
if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif (( $+commands[wget] )); then
  alias get='wget --continue --progress=bar --timestamping'
fi

if (( $+commands[htop] )); then
  alias top=htop
fi

# Resource Usage
alias df='df -kh'
alias du='du -kh'

#Global Aliases
alias -g C='| pbcopy'
alias -g G='|grep -i '
# Use this with ls to show octal file permissions e.g. ls -la LSN
alias -g LSN=$'| awk \'{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));if(k)printf("%0o ",k);print}\''
alias -g X='| xargs'

# Daily useful stuff
alias ll="l -d .*/ */ "
alias lf="ls -la"
alias la="ls -la"
alias lc="ls -AlCF "

# Use pygmentize to color cat output, if available
if (( $+commands[pygmentize] )); then
    unalias cat 2>/dev/null
    alias cat='pygmentize -O console256 -g'
fi

# Alias git to g
if (( $+commands[git] )); then
    unalias g 2>/dev/null
    alias g='git'
fi

(( $+commands[nvim] )) && alias vim="nvim"
