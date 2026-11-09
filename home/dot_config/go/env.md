# Env

## command to help

By default env prints information as a shell script.

```sh
# usage: go env [-json] [-changed] [-u] [-w] [var ...]
> go env -changed
```

NAME=VALUE is the environment variable, writhing environment variable so many times is not easy.

- `-changed`: prints only if "NAME=VALUE" != "NAME=DefaultVALUE".
- `-u NAME`: unsets the default setting for NAME=VALUE.
- `-w NAME=VALUE`: changes settings of NAME to VALUE.
- `-json`: prints in JSON format.

## defaults

The go env command exposes [several environment variables](https://go.dev/src/cmd/go/internal/envcmd/env.go).

### 📁 Core Workspace & Cache Paths

| Variable   | Description                                 | Linux Default                 | Windows Default                                               |
| ---------- | ------------------------------------------- | ----------------------------- | ------------------------------------------------------------- |
| GOPATH     | Root of the user workspace.                 | $HOME/go                      | %USERPROFILE%\go                                              |
| GOCACHE    | Build and test cache directory.             | $HOME/.cache/go-build (Linux) | $HOME/Library/Caches/go-build (macOS) %LocalAppData%\go-build |
| GOMODCACHE | Downloaded module dependency storage.       | {GOPATH:-$HOME/go}/pkg/mod    | %GOPATH%\pkg\mod                                              |
| GOBIN      | Directory where go install places binaries. | {GOPATH:-$HOME/go}/bin        | %GOPATH%\bin                                                  |

### 🛠️ Toolchain Paths

| Variable  | Description                                   | Linux Default                  | Windows Default                 |
| --------- | --------------------------------------------- | ------------------------------ | ------------------------------- |
| GOROOT    | Root of the Go SDK/compiler installation.     | /usr/local/go                  | C:\Program Files\Go             |
| GOTOOLDIR | Internal binaries for the compiler toolchain. | `$GOROOT/pkg/tool/<os>_<arch>` | `%GOROOT%\pkg\tool\<os>_<arch>` |

### 📊 System & Configuration Paths

| Variable       | Description                                                                                  | Linux Default              | Windows Default        |
| -------------- | -------------------------------------------------------------------------------------------- | -------------------------- | ---------------------- |
| GOENV          | The path to your local persistent Go environment configuration file (managed via go env -w). | $HOME/.config/go/env       | %AppData%\go\env       |
| GOTELEMETRYDIR | Location where Go telemetry data and local reports are saved.                                | $HOME/.config/go/telemetry | %AppData%\go\telemetry |

## Sources

- [medium.com](https://medium.com/@dilandashintha/understanding-go-env-1109bcba9a9c)
- [geeksforgeeks.org](https://www.geeksforgeeks.org/go-language/golang-gopath-and-goroot/)
- [oneuptime.com](https://oneuptime.com/blog/post/2026-01-23-go-gopath-goroot/view)
