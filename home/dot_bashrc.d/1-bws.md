# Bitwarden Secrets Manager in Bash

`1-bws.sh.tmpl` is sourced by the Bash startup configuration. Its chezmoi
template reads the local Bitwarden Secrets Manager access token through
`secret-tool`, then resolves selected secret values into environment variables.

The token and resolved values are rendered into the generated shell file on the
local machine. They are not values to copy into this repository or its public
documentation.

The [Bitwarden overview](../../docs/bitwarden) links this shell setup to
other related documentation.
