$Env:EDITOR="emacs"

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

. "$HOME/.config/powershell/LocalSettings.ps1" | Invoke-Expression

oh-my-posh init pwsh --config ~/.config/powershell/cocoatype.omp.json | Invoke-Expression
