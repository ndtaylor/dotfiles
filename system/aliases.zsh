# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  ls_command='gls'
else
  ls_command='ls'
fi
alias ls="${ls_command} -F --color"
alias l="${ls_command} -lAh --color"
alias ll="${ls_command} -l --color"
alias la="${ls_command} -A --color"

