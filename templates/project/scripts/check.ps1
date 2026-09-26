$ErrorActionPreference = "Stop"
Push-Location (Split-Path $PSScriptRoot -Parent)

try {
    $formatTargets = @("src")
    if (Test-Path -LiteralPath "tests") {
        $formatTargets += "tests"
    }

    & stylua @formatTargets
    if ($LASTEXITCODE -ne 0) {
        throw "StyLua formatting failed"
    }

    New-Item -ItemType Directory -Force "build" | Out-Null
    & rojo build default.project.json --output build/code.rbxlx
    if ($LASTEXITCODE -ne 0) {
        throw "Rojo build failed"
    }
}
finally {
    Pop-Location
}
