# Dotfiles

Personliga dotfiles för Omarchy, hanterade med [chezmoi](https://www.chezmoi.io/).
Repot är publikt och ska aldrig innehålla hemligheter eller lokal kontodata.
Bitwarden Secrets Manager är avsedd lagringsplats om framtida mallar behöver hemligheter och
SSH-nycklar. Den GitHub-e-postadress som används av mallarna finns i
`.chezmoidata.toml` under `github.noreply_email`.

## Återskapa en ny Omarchy-installation

Installera chezmoi:

```sh
omarchy pkg add chezmoi
```

Hämta repot, applicera konfigurationen och installera hanterade applikationer:

```sh
chezmoi init --apply Bogstag
```

Lagra Bitwarden Secrets Manager BWS_TOKEN med hjälp av secret-tool

```sh
secret-tool store --label="Bitwarden Secrets Token" "BWS_ACCESS" "TOKEN"
# Klistra in TOKEN när du får frågan. Exportera sedan ut variabeln på lämpligt sätt.
export BWS_ACCESS_TOKEN="$(secret-tool lookup "BWS_ACCESS" "TOKEN")"
```

Sätt Token som data och hämta sedan hemligheterna så här:

```toml
[data]
{{ if eq .chezmoi.os "linux" -}}
bws_access_token = {{ output "secret-tool" "lookup" "BWS_ACCESS" "TOKEN" | quote }}
{{- end }}

{{ (bitwardenSecrets "0c12859e-ac06-43fd-bec3-b4ce0126fb07" .bws_access_token).value }}
```

Inloggningen är lokal för datorn och lagras inte i dotfiles-repot. Den nuvarande
konfigurationen innehåller inga mallar som läser hemligheter från Bitwarden.

Konfigurera GitHub CLI om maskinen även ska kunna pusha ändringar:

```sh
gh auth login
gh auth status
```

### Bitwarden SSH-agent och GitHub-signering

Bitwarden Desktop ska ha SSH-agenten aktiverad. Mallen för `~/.ssh/config`
ansluter GitHub till den lokala socketen `~/.bitwarden-ssh-agent.sock`; privata
nycklar lämnar därför aldrig Bitwarden. Git väljer den agentnyckel vars
kommentar är `GithubSigningKey` för SSH-signering.

## Daglig användning av chezmoi

Visa hanterade ändringar:

```sh
chezmoi status
chezmoi diff
```

Applicera repots version på datorn:

```sh
chezmoi apply
```

Lägg till en ny fil:

```sh
chezmoi add ~/.config/program/config
```

Synka en fil som redigerats direkt i hemkatalogen tillbaka till chezmoi:

```sh
chezmoi re-add ~/.config/program/config
```

Redigera en hanterad fil genom chezmoi:

```sh
chezmoi edit ~/.config/program/config
chezmoi diff
chezmoi apply
```

Hämta senaste versionen från GitHub och applicera den:

```sh
chezmoi update
```

Öppna ett shell i repots lokala arbetskopia:

```sh
chezmoi cd
```

Kontrollera alltid `chezmoi diff` och `git diff --cached` före commit.

## Installera applikationerna igen

Bootstrap-scriptet är ett `run_once`-script och körs därför automatiskt en gång
per dator. Ändringar i scriptet gör inte att det körs igen. Det kan köras
manuellt från terminalen och är säkert att upprepa:

```sh
bash "$(chezmoi source-path)/run_once_after_10-install-applications.sh"
```

Tailscale behöver därefter aktiveras och godkännas en gång per dator:

```sh
omarchy install service tailscale
```

Kommandot startar tjänsten, aktiverar Taildropoch lägger till Tailscale i panelen.
Tailscales maskinidentitet och autentisering är lokala och sparas inte i dotfiles.

## Sätta korrekt locale

Ange vilka språk som ska genereras.

```bash
sudo nvim /etc/locale.gen
# Okommentera dessa språk
en_GB.UTF-8 UTF-8
en_US.UTF-8 UTF-8
sv_SE.UTF-8 UTF-8
```

Alternativt så går det att generera dessa direkt utan .gen filen.
**Jag har aldrig testat.**

```bash
sudo locale-gen en_GB.UTF-8 en_US.UTF-8 sv_SE.UTF-8
```

Kör `sudo locale-gen`för att generera språken.

```bash
sudo locale-gen
Generating locales...
en_GB.UTF-8... done
en_US.UTF-8... done
sv_SE.UTF-8... done
Generation complete.
```

Konfigurera de språk som ska användas.

```bash
>_ sudo nvim /etc/locale.conf
# Do not set overrides everything below!
# LC_ALL

# Primary language is British English.
# First fallback to Swedish, second fallback to generic English.
LANGUAGE=en_GB:sv:en

# Global default fallback for everything else
LANG=en_GB.UTF-8
# LC_MESSAGES inherits from LANG
# LC_CTYPE inherits from LANG

# Sorting (Swedish: Z, Å, Ä, Ö)
LC_COLLATE=sv_SE.UTF-8

# Swedish regional formats
LC_ADDRESS=sv_SE.UTF-8
LC_IDENTIFICATION=sv_SE.UTF-8
LC_MEASUREMENT=sv_SE.UTF-8
LC_MONETARY=sv_SE.UTF-8
LC_NAME=sv_SE.UTF-8
LC_NUMERIC=sv_SE.UTF-8
LC_PAPER=sv_SE.UTF-8
LC_TELEPHONE=sv_SE.UTF-8
LC_TIME=sv_SE.UTF-8
```

## hk-täckning

`hk check --all --plan` visar vilka steg hk väljer. Kör
`python3 .utils/check-hk-coverage.py --report` för att se spårade filer
som bara får allmänna kontroller, inte väljs alls eller är symboliska länkar.
`hk-coverage` körs även av pre-commit-hooken. Baslinjen i
`tests/hk-coverage-baseline.json` listar befintliga luckor; nya luckor gör
att steget misslyckas tills en kontroll lagts till eller baslinjen granskats.
Planen visar filval, inte om kontrollerna har körts tidigare.

## chezmoi symlinks

Att skapa dessa har egentligen inte varit så svårt, men det har alltid varit något trots den fina beskriningen. Här kommer minnes anteckning på hur jag ska tänka för att få till dessa.

I detta exempel så ska jag symlinka vscode keybindings:

```sh
# Copy file you whant symlinked to dotfiles
cp $(chezmoi target-path)/.config/Code/User/keybindings.json  $(chezmoi source-path)/dot_config/private_Code/User/keybindings.json

# Add the file to chezmoi ignore, path from your home not from dotfiles.
echo .config/Code/User/keybindings.json >> $(chezmoi source-path)/.chezmoiignore

# create the symlink template
echo -n "{{ .chezmoi.sourceDir }}/dot_config/private_Code/User/keybindings.json" > $(chezmoi source-path)/dot_config/private_Code/User/symlink_keybindings.json.tmpl
```

### mise Tasks

<!-- mise-tasks -->

## `Check`

- **Usage:** `Check`

## `Chezmoi-edit-config`

- **Usage:** `Chezmoi-edit-config`

## `Fix`

- **Usage:** `Fix`

## `Get-all-file-ext-in-dir`

- **Usage:** `Get-all-file-ext-in-dir`

## `List-gotmpl-diff`

- **Usage:** `List-gotmpl-diff`

List files whose formatting differs from gotmplfmt's

## `Stage-unstaged`

- **Usage:** `Stage-unstaged`

## `Update-schema-ryl`

- **Usage:** `Update-schema-ryl`

## `format:gotmpl:write`

- **Usage:** `format:gotmpl:write`

Format go templates

## `install-newer-versions`

- **Usage:** `install-newer-versions`

## `pre-commit`

- **Usage:** `pre-commit`

## `render:tasks`

- **Usage:** `render:tasks`

Generate tasks documentation
<!-- /mise-tasks -->
