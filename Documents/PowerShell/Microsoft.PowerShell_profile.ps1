# =============================================================================
# Microsoft.PowerShell_profile.ps1 — Windows PowerShell & PowerShell 7 Profile
# Matches macOS Zsh & Git Bash configuration via Chezmoi
# =============================================================================

# --- UTF-8 Output Encoding ---
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# --- Environment & PATH ---
$localBin = Join-Path $HOME ".local\bin"
if ($env:PATH -notlike "*$localBin*") {
    $env:PATH = "$localBin;$env:PATH"
}

# --- PSReadLine - Predictive IntelliSense & Auto-suggestions ---
if (Get-Module -ListAvailable -Name PSReadLine) {
    Import-Module PSReadLine
    $psrl = Get-Module PSReadLine
    if ($psrl.Version -ge [version]"2.1.0") {
        Set-PSReadLineOption -PredictionSource History
        Set-PSReadLineOption -PredictionViewStyle ListView
    }
    Set-PSReadLineOption -EditMode Windows
    Set-PSReadLineKeyHandler -Key Tab -Function Complete
}

# --- Shared Navigation Shortcuts ---
function .. { Set-Location .. }
function ... { Set-Location ../.. }
function .... { Set-Location ../../.. }

# --- Shared Git Shortcuts ---
function g { git $args }
function gs { git status -sb }
function ga { git add $args }
function gc { git commit $args }
function gcm { git commit -m $args }
function gco { git checkout $args }
function gd { git diff $args }
function gl { git log --oneline --graph --decorate -n 20 $args }
function gp { git push $args }
function gpl { git pull $args }

# --- Chezmoi Shortcuts ---
function dot { chezmoi $args }
function dota { chezmoi apply $args }
function dotd { chezmoi diff $args }
function dots { chezmoi status $args }
function dotcd { chezmoi cd $args }

# --- Utility Functions ---
function mkcd { param([string]$dir) New-Item -ItemType Directory -Path $dir -Force | Out-Null; Set-Location $dir }
function reload { . $PROFILE }

# --- Starship Cross-Shell Prompt ---
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}
