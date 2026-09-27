
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

. "$HOME/.cargo/env"
. "$HOME/Library/Application Support/org.dfinity.dfx/env"

export PATH="/Users/dheerajmurthy/.local/share/solana/install/active_release/bin:$PATH"
