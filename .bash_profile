if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
ENV=$HOME/.bashrc
export ENV
export DISPLAY=:0

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Homebrew
export PATH=/usr/local/sbin:$PATH

