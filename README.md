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

Installationsscriptet använder `omarchy pkg add` och installerar för närvarande:

- Bitwarden
- Bitwarden CLI
- Steam
- Visual Studio Code

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

Bootstrap-scriptet körs automatiskt första gången dess version appliceras. Paketkommandot kan även köras manuellt och är säkert att upprepa:

```sh
omarchy pkg add bitwarden bitwarden-cli steam visual-studio-code-bin
```

Bitwardens lokala appdata, Bitwarden CLI-sessioner, Steam-spel, cache och kontodata hanteras inte av chezmoi.
