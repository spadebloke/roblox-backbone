$ErrorActionPreference = "Stop"
Push-Location (Split-Path $PSScriptRoot -Parent)

try {
    & rokit install
    if ($LASTEXITCODE -ne 0) {
        throw "Rokit install failed"
    }

    if (Test-Path -LiteralPath "wally.toml") {
        & wally install
        if ($LASTEXITCODE -ne 0) {
            throw "Wally install failed"
        }
    }
}
finally {
    Pop-Location
}
