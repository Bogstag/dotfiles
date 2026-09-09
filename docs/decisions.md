# Beslut och verifierat nuläge för dotfiles

Uppdaterat 2026-09-09. Detta är den enda regelkällan för Bogstags
dotfiles-specifika beslut. Homelab-pluginen ska läsa dessa regler, inte
underhålla en kopia. Repo: <https://github.com/Bogstag/dotfiles>.

**Beslutat** betyder uttryckligt användarbeslut. **Uppgivet** betyder uppgift
från användaren, inte lokal verifiering. **Verifierat** avser angivna filer,
kommandon eller officiella källor vid kontrolldatumet. Öppna frågor och
antaganden får inte behandlas som beslut eller tillstånd.

## Beslut

| Beslut | Omfattning och status | Motivering/historik |
| --- | --- | --- |
| Omarchy på laptop; Windows 11 på stationär dator. | Beslutade målmiljöer. Windows är användaruppgift, inte undersökt här. | Ingen motivering angiven. |
| Chezmoi hanterar dotfiler och arbetsflöden kring paketinstallation. | Beslutat för båda miljöerna; befintlig implementation är främst Linux. | Ingen motivering angiven. |
| Upptäck källkatalog med `chezmoi source-path`. | Beslutat; ingen absolut maskinsökväg i återanvändbar skill. | Sökvägen är lokal information. |
| Agentens direkta paketanrop på Omarchy ska gå via Omarchys verktyg. Anropa aldrig `pacman` eller `yay` direkt, inte heller som reservlösning. | Beslutat. Omarchys interna användning av underliggande pakethanterare är tillåten. | Användaren installerar idag oftast via menyn och vill använda Omarchys gränssnitt. |
| Scoop är förstahandsval på Windows. WinGet får endast användas för uttryckliga undantag. | Beslutat. .NET är ett exempel; paket, varianter, versioner och ID:n återstår. | Ingen ytterligare motivering angiven. |
| Om ett paket saknas i Scoop: utred alternativ och fråga innan ett nytt WinGet-undantag införs. | Beslutad gräns för nya undantag. Inget automatiskt byte av pakethanterare. | Ingen motivering angiven. |
| Bitwarden Desktop och `bw` används på båda datorerna; Desktop SSH-agent är aktiverad på båda. Bevara integrationen. | Användaruppgift och beslutad inriktning. Lokalt underlag nedan; Windows ej verifierat. | Befintlig integration ska bevaras. |
| `bws` används sällan; användningen är ännu ospecificerad. Det är inget generellt beroende. | Beslutat. Anta inte att `bw` och `bws` är utbytbara eller delar autentisering. | De har olika roller; användningsfallet för `bws` är inte kartlagt. |
| Git och GitHub CLI (`gh`) används. | Beslutat verktygsval. | Ingen motivering angiven. |
| Följ relevant officiell dokumentation och skilj fakta, antaganden och personliga beslut. | Beslutat arbetssätt; ange källa och verifieringsdatum för tekniska påståenden. | Ingen motivering angiven. |

## Godkännande och förhandsgranskning

Inom ett givet uppdrag får agenten läsa, analysera, redigera arbetsrepots
filer och köra kontroller som inte ändrar systemet. Förberedelse i repot är
tillåten; tillämpning är ett separat steg.

Efter förhandsgranskning krävs uttryckligt användargodkännande för:

- att tillämpa dotfiler på datorn;
- att installera, uppdatera eller avinstallera paket;
- att ändra aktiva SSH-, säkerhets- eller nätverksinställningar;
- att pusha eller publicera.

Förhandsgranskningen ska visa omfattning, diff, berörda mål, planerade
kommandon och skriptens sidoeffekter: paket, tjänster, filer, nätverksanrop,
globala verktyg och autentisering. Beskriv även vad som inte kunnat granskas.
Godkännande av ett WinGet-undantag är inte automatiskt godkännande av installation.
Om den granskade omfattningen ändras ska den nya omfattningen förankras.

Läs inte ut valvposter, hemligheter, tokens eller sessionsvärden för att
kartlägga integrationen. Be aldrig användaren klistra in dem. Granska mallkod
innan rendering: även en diff eller mallrendering kan utlösa extern åtkomst.
Att läsa en instruktion med `apply`, installation eller push ger inget tillstånd
att köra den. Dokumentationen ska hållas utanför målstate via `.chezmoiignore`.

## Verifierat lokalt 2026-09-09

- `chezmoi source-path` gav `/home/bogge/.local/share/chezmoi` och origin var
  `git@github.com:Bogstag/dotfiles.git`. Sökvägen är en lokal observation,
  inte en portabel standard. Installerad chezmoi: `v2.72.0`.
- `/usr/share/omarchy/bin/omarchy-pkg-add` och `omarchy pkg add --help`
  anger **`omarchy pkg add <packages...>`** för installation av saknade
  Arch-paket. Den officiella upstream-källan anger samma gränssnitt [O1].
  `omarchy install --help` listar särskilda installationsflöden, till exempel
  appar och tjänster; `omarchy install <paket>` är inte det generiska gränssnittet.
  Lokal wrapper och upstream skiljer sig i hanteringen av redan privilegierad
  körning, men båda använder pacman internt. Ingen installation kördes.
- `run_once_after_10-install-applications.sh` använder redan `omarchy pkg add`.
  Skriptet skapar också `~/Sync` och aktiverar/startar Syncthing som användartjänst.
  Dessa sidoeffekter måste finnas med i en framtida förhandsgranskning.
- `run_once_after_20-install-codex-skills.sh` installerar globala skills via
  `npx`; `run_onchange_after_30-update-codex-skills.sh` uppdaterar dem via nätet.
  De kördes inte. Deras frånvaro i en vanlig fildiff är inte bevis för att
  tillämpning saknar sidoeffekter [C3].
- `bw` finns på PATH; Bitwarden Desktop har en lokal desktop-post och
  `~/.bitwarden-ssh-agent.sock` finns som socket. `bws` hittades inte på PATH
  i denna session. Detta motsäger inte användarens uppgift om sällsynt användning.
  Socketens närvaro bevisar inte upplåsning eller fungerande signering.
- `private_dot_ssh/private_config.tmpl` använder Bitwardens socket för GitHub.
  Git-mallen och två wrappers kopplar Git-signering till samma agent och
  nyckelkommentaren `GithubSigningKey`. Inga nycklar listades eller hämtades.
- `private_dot_ssh/executable_allowed_signers.tmpl` anropar chezmois
  `bitwarden`-funktion för en posts publika SSH-nyckel. `.chezmoi.toml.tmpl`
  anger automatisk upplåsning. Mallarna lästes som text, inte renderades.
  Ingen aktuell `bw`/`bws`-autentisering eller Windows-konfiguration verifierades.

`bw` hör till Password Manager och använder sin egen login/upplåsningssession
[B1]. `bws` hör till Secrets Manager och använder åtkomsttoken för ett
maskinkonto [B2]. Desktop-agenten är en separat integrationsyta [B3].
En upplåst app ska inte tas som bevis för en användbar CLI-session.

## Konflikter och kvarstående arbete

- README säger att inga mallar läser Bitwarden; signeringsmallen gör det redan.
- README säger att en ändrad `run_once`-fil inte körs igen. Officiell chezmoi-
  dokumentation anger i stället en gång per unikt innehåll, registrerat med
  innehållshash [C3]. En ändring kan alltså innebära ny körning.
- README visar `init --apply`, `update`, direkt skriptkörning och push utan
  agentens nya godkännandesteg. Exemplen ger inte agenten tillstånd att verkställa.
- Windows är en målmiljö men ännu inte en färdig implementation. Linux-socketar,
  shellwrappers och scripts 20/30 är inte avgränsade till Linux av nuvarande
  `.chezmoiignore`. Windows-körning får därför inte antas säker eller fungerande.
  Starship är avsedd att vara gemensam enligt AGENTS.md; övrig uppdelning återstår.
- Paketbootstrap följer redan det beslutade Omarchy-gränssnittet. Att varje
  listat paket är tillgängligt i aktuella källor har inte verifierats.

Installationsskript och andra dotfiler ändras inte i denna utredning. En
befintlig lokal ändring av Codex-modifieraren lämnas orörd. Den enda
konfigurationsändringen är att ignorera dokumentationskatalogen.

Kontroll efter dokumentationsändringen: `chezmoi managed --skip-secrets
--refresh-externals=never --include=files,dirs --path-style=relative` listar
varken `README.md`, `AGENTS.md`, `docs` eller dess innehåll. Övriga listade
målposter är desamma som före ändringen. `git diff --check` och lokala
dokumentlänkar passerar; Codex-modifierarens checksumma är oförändrad.
Ingen generell mallrendering eller `chezmoi apply` kördes.

Öppet inför konkreta uppdrag, men inte blockerande för att skriva skillen:
gemensamma respektive OS-specifika filer, Windows skal/WSL, exakta paket och
WinGet-undantag, faktisk Windows SSH-konfiguration och avgränsat bruk av `bws`.
Skillen ska undersöka eller fråga när respektive fråga blir relevant.

## Historik och källor

De första besluten dokumenterades 2026-09-09 i pluginrepots `docs/decisions.md`.
De flyttades hit efter användarens förtydligande samma dag. Tidigare öppna frågor
om Omarchy-gränssnitt, Bitwarden-klienter och godkännande är nu besvarade enligt
ovan. Beskrivningen ”omarchy install” preciserades genom kodläsning till
`omarchy pkg add` för generella paket. Motiveringar som inte lämnats har inte
konstruerats i efterhand.

Officiella källor lästa 2026-09-09 (upstream-kod/dokumentation, inte sökträffar):

- [O1: Omarchy, pkg-add](https://github.com/basecamp/omarchy/blob/master/bin/omarchy-pkg-add).
- [C1: chezmoi source-path](https://www.chezmoi.io/reference/commands/source-path/).
- [C2: chezmoi ignore](https://www.chezmoi.io/reference/special-files/chezmoiignore/): mönster matchar målsökvägar, inte källnamn; katalog och innehåll behöver täckas.
- [C3: chezmoi scripts](https://www.chezmoi.io/user-guide/use-scripts-to-perform-actions/): körordning, innehållshash och att dry-run inte kör scripts.
- [C4: chezmoi managed](https://www.chezmoi.io/reference/commands/managed/): listar hanterade målposter.
- C1–C4 lästes som Markdown i [chezmois officiella dokumentationskälla](https://github.com/twpayne/chezmoi/tree/master/assets/chezmoi.io/docs).
- [B1: Bitwarden Password Manager CLI](https://bitwarden.com/help/cli/).
- [B2: Bitwarden Secrets Manager CLI](https://bitwarden.com/help/secrets-manager-cli/).
- [B3: Bitwarden SSH Agent](https://bitwarden.com/help/ssh-agent/).
- [W1: Scoop, officiell README](https://github.com/ScoopInstaller/Scoop): Windows-installerare med paketmanifest och beroenden.
- [W2: Microsoft WinGet install](https://github.com/MicrosoftDocs/windows-dev-docs/blob/docs/hub/package-manager/winget/install.md): `search`/`show` identifierar paket; `--id` och `--exact` avgränsar valet. Inget paket-ID har valts här.
