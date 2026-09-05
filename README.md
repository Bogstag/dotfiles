# Dotfiles

Personliga dotfiles för Omarchy, hanterade med [chezmoi](https://www.chezmoi.io/).
Repot är publikt och ska aldrig innehålla hemligheter eller lokal kontodata.
Bitwarden är avsedd lagringsplats om framtida mallar behöver hemligheter.

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

Logga därefter in i Bitwarden CLI:

```sh
bw login
bw status
```

Inloggningen är lokal för datorn och lagras inte i dotfiles-repot. Den nuvarande
konfigurationen innehåller inga mallar som läser hemligheter från Bitwarden.

Konfigurera GitHub CLI om maskinen även ska kunna pusha ändringar:

```sh
gh auth login
gh auth status
```

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
