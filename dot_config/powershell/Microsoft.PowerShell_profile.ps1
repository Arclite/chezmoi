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

Invoke-Expression (&/usr/local/bin/starship init powershell)

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
