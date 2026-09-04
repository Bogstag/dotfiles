# Dotfiles

Personliga dotfiles för Omarchy, hanterade med [chezmoi](https://www.chezmoi.io/).

Hemligheter hämtas från Bitwarden vid behov och lagras aldrig i klartext i repot.

## Återskapa en ny Omarchy-installation

Installera chezmoi:

```sh
omarchy pkg add chezmoi
```

Hämta repot, applicera konfigurationen och installera hanterade applikationer:

```sh
chezmoi init --apply Bogstag
```

Vilka applikationer som hanteras finns i `run_once_after_10-install-applications.sh`.
Tailscale-skillen för Codex installeras globalt av
`run_once_after_20-install-codex-skills.sh`. Installationen kräver Node.js och
`npx`.

Logga därefter in i Bitwarden CLI:

```sh
bw login
bw status
```

Chezmoi låser upp Bitwarden automatiskt när en mall behöver en hemlighet och låser valvet igen efter kommandot.

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

Bootstrap-scriptet körs automatiskt första gången dess version appliceras. Det kan även köras manuellt från terminalen och är säkert att upprepa:

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

Tailscale-skillen installeras globalt från sitt upstream-repo med
[`skills`](https://github.com/vercel-labs/skills):

```sh
npx skills add https://github.com/tailscale/tailscale-skill --global --agent codex --skill tailscale --yes
```

`run_after_30-update-codex-skills.sh` uppdaterar globala skills automatiskt
efter varje `chezmoi apply` och därmed även efter `chezmoi update`. Uppdatera
manuellt med:

```sh
# Endast globala skills
npx skills update -g

# Endast skills i det aktuella projektet
npx skills update -p

# Utan frågor; väljer projekt-scope i ett projekt, annars globalt scope
npx skills update -y
```

Använd `npx skills update -g -y` i script och annan automation för att undvika
att scope avgörs av aktuell arbetskatalog.
