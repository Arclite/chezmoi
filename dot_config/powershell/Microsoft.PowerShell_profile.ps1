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

oh-my-posh init pwsh --config ~/.config/powershell/cocoatype.omp.json | Invoke-Expression

# Install PsFzf bindings
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Fix tab completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
