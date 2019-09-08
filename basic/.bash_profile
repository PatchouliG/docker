export M2_HOME=/Library/maven/apache-maven-3.5.0
export PATH=$PATH:$M2_HOME/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin

export MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL:~/go/bin
export GOPATH=~/go
export GOROOT=/usr/local/go
export GOBIN=/usr/local/go/bin

export CLASSPATH=".:/usr/local/go/bin:/usr/local/lib/antlr-4.7.1-complete.jar:/usr/local/lib/commons-collections4-4.0.jar:/Users/wn/my-app/src/main/java:$CLASSPATH"
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'
set  -o vi
source ~/.git-completion.bash
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export http_proxy=http://127.0.0.1:50720
export https_proxy=http://127.0.0.1:50720

export PATH="/usr/local/opt/bison/bin:$PATH"
alias bison=/usr/local/opt/bison/bin/bison
export PATH="/Users/wn/code/luadec/luadec/:$PATH"

alias ll='ls -lG'
alias make='make  -j 8'
alias gd='git diff'


export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/code/llvm-project/install/bin/:$PATH"
