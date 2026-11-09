# Bitwarden in the shell

The shell startup configuration reads a Bitwarden Secrets Manager access token
from the desktop secret store, then uses it to make selected secrets available
as environment variables. This keeps secret values out of the dotfiles source.

See the [BWS shell setup](../home/dot_bashrc.d/1-bws) for the implementation
and the variables it defines.
