$Env:EDITOR="emacsclient"

function exec {
    $command = ($args -join " ")
    Invoke-Expression $command
}

function title {
    param(
        $title
    )

    $Host.UI.RawUI.WindowTitle = $title
}

New-Alias ls Get-ChildItem

. "$HOME/.config/powershell/LocalSettings.ps1" | Invoke-Expression

# Cache the oh-my-posh init script (the actual --print payload, not the
# wrapper that re-invokes oh-my-posh); regenerate only when the omp binary
# or theme file changes.
$ompCache = "$HOME/.cache/powershell/omp-init.ps1"
$ompTheme = "$HOME/.config/powershell/cocoatype.omp.json"
$ompStamp = "$(oh-my-posh version)|$((Get-Item $ompTheme).LastWriteTimeUtc.Ticks)"
$ompStampFile = "$ompCache.stamp"
if (-not (Test-Path $ompCache) -or -not (Test-Path $ompStampFile) -or (Get-Content $ompStampFile -Raw) -ne $ompStamp) {
    New-Item -ItemType Directory -Force -Path (Split-Path $ompCache) | Out-Null
    oh-my-posh init pwsh --config="$ompTheme" --print | Set-Content $ompCache
    Set-Content $ompStampFile $ompStamp -NoNewline
}
Get-Content $ompCache -Raw | Invoke-Expression

# Install PsFzf bindings, deferring the module import (~400ms) until first use
Set-PSReadLineKeyHandler -Chord 'Ctrl+t' -ScriptBlock {
    Import-Module PSFzf
    Set-PSReadLineKeyHandler -Chord 'Ctrl+t' -ScriptBlock { Invoke-FzfTabCompletion }
    Invoke-FzfTabCompletion
}
Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -ScriptBlock {
    Import-Module PSFzf
    Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -ScriptBlock { Invoke-FuzzyHistory }
    Invoke-FuzzyHistory
}

# Fix tab completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
