# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DEFAULT_USER=drew
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
#ZSH_THEME="random"
ZSH_THEME="candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

DISABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

alias docker="/usr/local/bin/docker --tls"
alias njs="cd ~/work/tools/node-rmn"
alias vc="cd /Volumes/Development/dev/vouchercodes"
alias rmn="cd ~/work/rmn"
alias pt="/Users/drew/go/bin/pt --nogroup"
alias rmnup="docker run -dt -v /Users/drew/work/rmn/:/var/lib/wsm/retailmenot -p 80:80 10.128.25.163/rmn"
alias rmnc="docker create --name rmn -t -v /Users/drew/work/rmn:/var/lib/wsm/retailmenot -p 80:80 rmn_web"
alias rmnmem="docker exec -it rmn killall memcached && memcached -d -u root"
alias d2b="cd ~/work/d2b"
alias rake='noglob rake'
alias g='git'
alias n4='/opt/local/adt/sdk/tools/emulator -avd Nexus4 -partition-size 128 &'
alias p4merge='/Applications/p4merge.app/Contents/Resources/launchp4merge'
#alias idea='/Applications/IntelliJ\ IDEA\ 12.app/Contents/MacOS/idea $PWD/$1'
alias idea='open -b com.jetbrains.intellij'
alias buildserver='ssh -f -N -L 8000:localhost:8080 -L 2700:localhost:27017 buildserver'
alias containercleandocker='docker rm `docker ps --no-trunc -a -q`'
alias imagecleandocker='docker rmi `docker images -q --filter "dangling=true"`'
alias mt='git co test; git pull; git merge -'
# emacs aliases
# alias emacs='emacsclient -n $*'
alias ed='emacs --daemon'
alias e='emacsclient -t'
alias ec='open -a /Applications/Emacs.app $@'
alias watch='fswatch -0 ~/work/rmn/www/gui/sass |  xargs -0 -n 1 -I {} sprite -gen ~/work/rmn/www/gui/build/im -b ~/work/rmn/www/gui/build/css/ -p ~/work/rmn/www/gui/sass -d ~/work/rmn/www/gui/im/sass ~/work/rmn/www/gui/sass/_pages/home.scss'

#alias git='nocorrect git'
source $ZSH/oh-my-zsh.sh
alias ick='ack -i --pager="less -R -S"'

# Customize to your needs...
PATH=/usr/local/go/bin:/usr/local/sbin:$PATH

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then

  # First try to load from a user install
fi

__git_files () {
    _wanted files expl 'local files' _files
}

### Go path
export GOROOT=/usr/local/go
export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export CDPATH=$CDPATH:$GOPATH/src/github.com

PATH=$GOROOT/bin:$GOPATH/bin:$PATH

#DOCKER
export DOCKER_CERT_PATH=/Users/drew/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

high_score() {
   git ls-tree -r -z --name-only HEAD -- $1 | xargs -0 -n1 git blame --line-porcelain HEAD |grep  "^author "|sort|uniq -c|sort -nr;
}
export PKG_CONFIG_PATH=$GOPATH/src/github.com/wellington/wellington/libsass/lib/pkgconfig

# Go test cover reports
cover-web() {
	t=$(mktemp -t cover)
	go test $COVERFLAGS -coverprofile=$t
	go tool cover -html=$t
}

# KUBERNETES
export KUBERNETES_PROVIDER=vagrant

# sassc/libsass exports
export SASS_SPEC_PATH=/Users/drew/code/sass-spec
export SASS_SASSC_PATH=/Users/drew/code/sassc
export SASS_LIBSASS_PATH=/Users/drew/code/libsass
export RMN_BASE_PATH=~/work/rmn
