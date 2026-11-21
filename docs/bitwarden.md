---
---

# Bitwarden

The shell startup configuration reads a Bitwarden Secrets Manager access token from the desktop secret store, then uses it to make selected secrets available as environment variables. This keeps secret values out of the dotfiles source.

See the [BWS shell setup](../home/dot_bashrc.d/1-bws) for the implementation and the variables it defines.

- Bitwarden handles ssh sock
  - [on Omarchy](../home/dot_config/environment.d/10-profile.conf.tmpl)
  - [on Windows](../home/dot_config/powershell/profile.ps1)
- [Signing key in git config](../home/dot_config/git/config.tmpl)
- [Holding secret calendar url](../home/dot_config/omarchy/private_calendars.json.tmpl)
- Holding ssh keys
  - [both public keys](../home/private_dot_ssh/private_id_ed25519_git.pub.tmpl)
  - [and private keys](../home/private_dot_ssh/private_config.tmpl)
