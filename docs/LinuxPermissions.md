# Linux Permissions

## Permissions in Linux

```sh
`0777  (lrwxrwxrwx)`
`0755  (drwxr-xr-x)`
`0711  (.rwx--x--x)`
`0700  (drwx------)`
`0644  (.rw-r--r--)`
`0600  (.rw-------)`
`0600  (srw-------)`
`0444  (.r--r--r--)`
```

### Home directory (~)

typically `755 (drwxr-xr-x)` or `700 (drwx------)`

| Numbers | Letters      | Comment                                                                                                                                                  |
| ------- | ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `0755`  | `drwxr-xr-x` | for .config. This is the standard baseline.                                                                                                              |
| `0700`  | `drwx------` | for ibus. Input method frameworks handle keystrokes and sensitive input data, so they lock out all other users.                                          |
| `0755`  | `drwxr-xr-x` | for imv. A standard directory structure for an image viewer configuration.                                                                               |
| `0644`  | `.rw-r--r--` | for starship.toml. Standard read/write configuration file for your prompt.                                                                               |
| `0600`  | `.rw------`  | for user-dirs.dirs. This maps your personal folder locations (Desktop, Downloads, Documents), which system applications restrict to your user eyes only. |
