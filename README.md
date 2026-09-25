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

Vilka applikationer som installeras finns i
`run_once_after_10-install-applications.sh`. Codex-skills för Tailscale och
chezmoi installeras globalt av `run_once_after_20-install-codex-skills.sh`.
Skill-installationen kräver Node.js och `npx`.

Lagra Bitwarden Secrets Manager BWS_TOKEN med hjälp av secret-tool

```sh
secret-tool store --label="Bitwarden Secrets Token" "BWS_ACCESS" "TOKEN"
# Klistra in TOKEN, sedan tar vi ut den med:
export BWS_ACCESS_TOKEN="$(secret-tool lookup "BWS_ACCESS" "TOKEN")"
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
kommentar är `GithubSigningKey` för SSH-signering och använder en lokalt
renderad wrapper så att Bitwardens socket fungerar även när `SSH_AUTH_SOCK`
inte redan är satt i skalet.

Efter att Bitwarden är upplåst och `chezmoi apply` har körts, autentisera om
GitHub CLI (den sparade inloggningen är maskinlokal) och publicera den publika
signeringsnyckeln:

```sh
gh auth login --git-protocol ssh
SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock" ssh-add -L \
  | awk '$3 == "GithubSigningKey" { print; exit }' \
  | gh ssh-key add - --type signing --title "$(hostname)-GitHub-signing"
```

Kommandot skickar endast den publika nyckeln till GitHub. Kontrollera först med
`ssh-add -l` att `GithubSigningKey` är den avsedda nyckeln.

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

## Committa och pusha

Från `chezmoi cd`:

```sh
git status
git diff
git add <filer>
git commit -m "Beskriv ändringen"
git push
```

Kontrollera alltid `chezmoi diff` och `git diff --cached` före commit, särskilt eftersom repot är publikt.

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

Kommandot startar tjänsten, öppnar inloggningen, aktiverar Taildrop-mottagning och lägger till Tailscale i panelen. Tailscales maskinidentitet och autentisering är lokala och sparas inte i dotfiles.

Bitwardens lokala appdata, Bitwarden CLI-sessioner, Steam-spel, cache och kontodata hanteras inte av chezmoi.

## Codex-skills

Globala Codex-skills installeras från sina upstream-repon med
[`skills`](https://github.com/vercel-labs/skills). Se
`run_once_after_20-install-codex-skills.sh` för vilka skills som installeras.

`run_onchange_after_30-update-codex-skills.sh` uppdaterar globala skills när
scriptet installeras eller ändras. Det körs alltså inte efter varje
`chezmoi apply`. Uppdatera manuellt med samma kommando som scriptet använder:

```sh
npx --yes skills update --global --yes
```

## Codex-konfiguration

`~/.codex/config.toml` är avsiktligt inte en helt hanterad chezmoi-fil:
Codex ändrar lokal appstatus och modellval i den. Modifieraren
`private_dot_codex/modify_private_config.toml.tmpl` säkerställer däremot vid varje
`chezmoi apply` att Aperture-providern och dess MCP-server är konfigurerade.
Övriga inställningar bevaras.
