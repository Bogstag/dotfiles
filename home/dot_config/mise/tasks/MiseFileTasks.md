---
---

# Mise File Tasks

A file task is an executable script in a task directory. Its path is the task name, and #MISE comments at the top hold its configuration.

On Linux and macOS, make the script executable:

```sh
chmod +x mise-tasks/build
```

## Name and group file tasks

A file's path below the task directory is its task name, with / replaced by :.

```sh
mise-tasks
├── build
├── db
│   └── migrate.sh
└── test
    ├── _default
    ├── integration
    └── units
```

| Path                     | `[TASK]`   |
| ------------------------ | ---------- |
| mise-tasks/db/migrate.sh | db:migrate |
| mise-tasks/gen.proto     | gen.proto  |
| mise-tasks/test/_default | test       |

## Tasks config

### Shebang

The shebang selects the interpreter.

| Shebang               | Interpreter            |
| --------------------- | ---------------------- |
| #!/usr/bin/env bash   | Bash, Shell or default |
| #!/usr/bin/env node   | Node                   |
| #!/usr/bin/env python | Python                 |
| #!/usr/bin/env pwsh   | Powershell             |

### Linux vs Windows

If you keep .ps1 non executable on Linux, then you can have same name with different extensions.

```sh
mise-tasks/
  build.sh       # #!/usr/bin/env bash
  build.ps1      # the Windows version
```

### #MISE comments

Add #MISE comments near the top of the script to set [task properties](https://mise.jdx.dev/tasks/task-configuration.html). All task properties works except:

- run, run_windows and file is replaced by the script.
- usage is replaced by `#USAGE` lines.

The comment marker can be:
`#`
`//` - Js, Ts, or Go
`::` for shell and bash

The keyword can also be bracketed. `#MISE`, `# MISE`, `// MISE`, and `# [MISE]` all work, so space after # does not break the header.

Each #MISE line holds TOML.

Example:

```sh
#!/usr/bin/env bash
#MISE description="Build the CLI"     # Visible in many places.
#MISE alias="b"                       # mise run b
#MISE sources=["Cargo.toml"]          # Files the task reads.
#MISE outputs=["target/debug/mycli"]  # Things the task creates.
#MISE env={RUST_BACKTRACE = "1"}      # Env vars for command
#MISE tags=["test", "slow"]           # Similar to depends
#MISE depends=["lint", "test"]        # Tasks finished before this runs.
#MISE tools={rust="1.90"}             # Tools to install and activate
script or command to run
```

depends accepts a glob patterns `#MISE depends=["test:*"]`

Dotted keys is a toml table one line at a time and without braces: `#MISE tools.node="24"`

### Extend with a task template

Extends names a [task template](https://mise.jdx.dev/tasks/templates.html).

```toml
# in mise.toml
[task_templates.rust]
tools = { rust = "1.90" }
env = { RUST_BACKTRACE = "1" }
```

```sh
# in mise-tasks/build
#!/usr/bin/env bash
#MISE extends="rust"
#MISE description="Build the CLI"
cargo build
```

## mise commands

### List tasks

- `mise tasks` - List tasks
- `mise tasks --extended` - List tasks and show all columns
- `mise tasks ls --tag lint` - Only show tasks that have this tag.

### run

- `mise run 'test:*'`
  - Runs test:code, test:units, not build:bin.
- `mise run 'test:*:local'`
  - Runs test:code:local, test:units:local, not test:build:bin:local
- `mise run 'test:**:local'`
  - Runs test:code:local, test:units:local and test:build:bin:local
- `mise run --tag lint`
  - Runs tasks with that tag.

#### Usage

`mise run [FLAGS] [TASK] [ARGS]`

#### Arguments

`[TASK]` - Task to run (default: default); separate several tasks with :::
`[ARGS]` - Arguments for the task; ::: starts the next task

#### Flags

`--affected` - Run matching tasks only where Git changes affect them
`-c`, `--continue-on-error` - Continue running tasks even if one fails
`-C`, `--cd <DIR>` - Change to this directory before running the tasks
`-n`, `--dry-run` - Print the tasks in the order they would run, without running them
`-q`, `--quiet` - Do not show extra output
