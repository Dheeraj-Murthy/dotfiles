
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
. "$HOME/.cargo/env"
. "$HOME/Library/Application Support/org.dfinity.dfx/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
