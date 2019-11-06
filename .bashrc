#   -*- shell-script -*-

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# XDG directories
#mw These shouldn't be necessary as they're all the defaults from
#   https://specifications.freedesktop.org/basedir-spec/latest/ar01s03.html
export XDG_CONFIG_HOME="$HOME/.config"
export  XDG_CACHE_HOME="$HOME/.cache"
export   XDG_DATA_HOME="$HOME/.local/share"

[ -r "$XDG_CONFIG_HOME/bash/functions" ] && . "$XDG_CONFIG_HOME/bash/functions"

#mw colorize ls output on Mac
export CLICOLOR=1
# pathprepend "/Applications/Aquamacs.app/Contents/MacOS/bin"
pathprepend "/Applications/Emacs.app/Contents/MacOS/bin"

######################################################################
### BEGIN Lattice Engines environment

export LE_STACK=mwarren
export LE_USING_DOCKER=true

#mw ledp/le-dev/scripts/start-cluster.sh uses $J8_HOME
J8_HOME=$(/usr/libexec/java_home -Fv 1.8 | grep amazon) && export J8_HOME
export JAVA_HOME=$J8_HOME

J11_HOME=$(/usr/libexec/java_home -Fv 11 | grep amazon) && export J11_HOME

pathprepend "/Applications/MySQLWorkbench.app/Contents/MacOS"

export ANACONDA_HOME=/opt/conda
pathprepend "$ANACONDA_HOME/bin"

export DOCKER_DATA_ROOT="$HOME/Docker"

# Setup LE dev't environment
export WSHOME="$HOME/Projects/ledp"
if [ -f $WSHOME/le-dev/latticerc ]; then
    . $WSHOME/le-dev/latticerc
fi

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export CATALINA_HOME=/opt/tomcat 
# export JAVA_OPTIONS="${JAVA_TOOL_OPTIONS} -Djava.library.path=/usr/local/opt/apr/libexec/lib"
pathappend "$CATALINA_HOME/libexec/bin"
pathappend "$CATALINA_HOME/bin"
export JPDA_PORT=4001

# export OPENSSL_ROOT_DIR="$(brew --prefix openssl)"
#mw hard code for speed
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl

# NVM setup
export NVM_DIR="$HOME/.nvm"
#mw hard code to speed up this script
# export NVM_HOME="$(brew --prefix nvm)"
export NVM_HOME=/usr/local/opt/nvm
# This loads nvm
[ -s "$NVM_HOME/nvm.sh" ] && . "$NVM_HOME/nvm.sh"

# Hadoop

export HDP_HOME=/opt/hdp

# More Hadoop settings
export HADOOP_HOME=$HDP_HOME/hadoop
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME
export HADOOP_TEZ_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export HADOOP_COMMON_JAR=$HADOOP_HOME/share/hadoop/common/hadoop-common-2.7.1.2.4.3.0-227.jar
export HADOOP_NAMENODE_DATA_DIR=$HADOOP_HOME/yarn/yarn_data/hdfs/namenode
export HADOOP_DATANODE_DATA_DIR=$HADOOP_HOME/yarn/yarn_data/hdfs/datanode

pathappend "$HADOOP_HOME/bin"
pathappend "$HADOOP_HOME/sbin"

export YARN_HOME=$HADOOP_HOME
  
export SQOOP_HOME=$HDP_HOME/sqoop
export SQOOP_CONF_DIR="${SQOOP_HOME}/conf"

export SPARK_HOME=/opt/spark
export LIVY_HOME=/opt/livy

# export PATH=/bin:/Users/mwarren/.nvm/versions/node/v8.11.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/MySQLWorkbench.app/Contents/MacOS:/usr/local/opt/hadoop/hadoop/bin:/usr/local/opt/hadoop/hadoop/sbin:

export PYSPARK_PYTHON=/opt/conda/envs/spark/bin/python
pathappend "$HOME/.local/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

### END Lattice Engines environment
######################################################################

### http://rafi.io/shell/pimp-up-your-shell/
source "$XDG_CONFIG_HOME/bash/exports"
source "$XDG_CONFIG_HOME/bash/secrets"
source "$XDG_CONFIG_HOME/bash/bashrc"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source "$XDG_CONFIG_HOME/bash/completion"
source "$XDG_CONFIG_HOME/bash/aliases"

####
# from https://serverfault.com/questions/3743/what-useful-things-can-one-add-to-ones-bashrc
export LESS_TERMCAP_mb=$'\033[01;31m'
export LESS_TERMCAP_md=$'\033[01;31m'
export LESS_TERMCAP_me=$'\033[0m'
export LESS_TERMCAP_se=$'\033[0m'
export LESS_TERMCAP_so=$'\033[01;44;33m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS_TERMCAP_us=$'\033[01;32m'

# from https://www.emacswiki.org/emacs/EmacsClient
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
