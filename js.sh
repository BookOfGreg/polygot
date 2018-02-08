# Setting the PS1 by hooking the pre-load.
_node_ps1() {
  NODE_PS1=$(node -v)
}
PROMPT_COMMAND="${PROMPT_COMMAND:-:};_node_ps1"


export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

alias nom='npm'
