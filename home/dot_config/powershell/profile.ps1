trap { Write-Warning ($_.ScriptStackTrace | Out-String) }
# $InformationPreference = "Continue"
# I wish $Profile was in $Home, but since it's not:
$ProfileDir = $PSScriptRoot
$IsVSCode = $ENV:TERM_PROGRAM -eq "vscode"

$ConfigHome = [Environment]::GetFolderPath("ApplicationData")
$DataHome = [Environment]::GetFolderPath("LocalApplicationData")

$Env:HOME="{{ .chezmoi.destDir }}"
$Env:LANG="en_GB.UTF-8"
$Env:SSH_AUTH_SOCK="{{ .chezmoi.destDir }}/.bitwarden-ssh-agent.sock"
$Env:XDG_CACHE_HOME="{{ .chezmoi.destDir }}/.cache"
$Env:XDG_CONFIG_HOME="{{ .chezmoi.destDir }}/.config"
$Env:XDG_DATA_HOME="{{ .chezmoi.destDir }}/.local/share"
$Env:XDG_DESKTOP_DIR="{{ .chezmoi.destDir }}/"
$Env:XDG_DOCUMENTS_DIR="{{ .chezmoi.destDir }}/Documents"
$Env:XDG_DOWNLOAD_DIR="{{ .chezmoi.destDir }}/Downloads"
$Env:XDG_MUSIC_DIR="{{ .chezmoi.destDir }}/Music"
$Env:XDG_PICTURES_DIR="{{ .chezmoi.destDir }}/Pictures"
$Env:XDG_PROJECTS_DIR="{{ .chezmoi.destDir }}/Projects"
$Env:XDG_PUBLICSHARE_DIR="{{ .chezmoi.destDir }}/"
$Env:XDG_STATE_HOME="{{ .chezmoi.destDir }}/.local/state"
$Env:XDG_TEMPLATES_DIR="{{ .chezmoi.destDir }}/"
$Env:XDG_VIDEOS_DIR="{{ .chezmoi.destDir }}/Videos"

# I can run `Update-PSModulePath` any time, but I don't by default
Set-Alias Update-PSModulePath $DataHome/powershell/Scripts/Update-PSModulePath.ps1
# I just read the cached values from the last run
if (Test-Path ($PSModulePathPath = [IO.Path]::ChangeExtension($Profile, "$Env:PSModulePath_Before"))) {
    $Env:PSModulePath_Before = $Env:PSModulePath
    $Env:PSModulePath = @(Get-Content $PSModulePathPath) -join [IO.Path]::PathSeparator
}
if (Test-Path ($PathPath = [IO.Path]::ChangeExtension($Profile, ".Path.env"))) {
    $Env:Path_Before = $Env:Path
    $Env:Path = @(Get-Content $PathPath) -join [IO.Path]::PathSeparator
} else {
    Update-PSModulePath
}

$Interactive = Convert-Path "$DataHome/powershell/Scripts/Initialize-Interactive.ps1"

if (!$Env:WARP_IS_LOCAL_SHELL_SESSION) {
    if ($IsVSCode -or $Host.UI.RawUI.KeyAvailable) {
        $Controlled = $false
        while ($Host.UI.RawUI.KeyAvailable -and ($key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown,IncludeKeyUp"))) {
            if (!$Controlled -and $key.ControlKeyState -match "LeftCtrlPressed") {
                $Controlled = $true
            }
        }
        if ($IsVSCode -or $Controlled) {
            Write-Host "Skipping Interactive Config. To complete, run:`n. `"$Interactive`"" -ForegroundColor Yellow
            if ($PSVersionTable.PSVersion.Major -gt 5) {
                function prompt { "`e[36m$($MyInvocation.HistoryId)`e[37m $pwd`e[0m`n❯" }
            } else {
                function prompt { "$([char]27)[36m$($MyInvocation.HistoryId)$([char]27)[37m $pwd$([char]27)[0m`n$([char]0x276f)" }
            }
            return
        }
    }

    function prompt {
        Write-Host "Preparing interactive session for first use..." -ForegroundColor Cyan
        . $Interactive
        # $InformationPreference = "SilentlyContinue"
    }
} else {
    . $Interactive
}
