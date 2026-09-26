$ErrorActionPreference = "Stop"
Push-Location (Split-Path $PSScriptRoot -Parent)
try {
    & rokit install
    if ($LASTEXITCODE -ne 0) { throw "Rokit install failed" }

    & wally install
    if ($LASTEXITCODE -ne 0) { throw "Wally install failed" }
} finally {
    Pop-Location
}
