# FiveM Server Manager
# Quick PowerShell tool to manage and launch FiveM servers

param(
    [string]$ServerPath = "A:\Gaming\Gta FiveM\Server List"
)

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "   FiveM Server Manager v1.0" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Check if server directory exists
if (-not (Test-Path $ServerPath)) {
    Write-Host "Error: Server directory not found at $ServerPath" -ForegroundColor Red
    Write-Host "Please update the ServerPath parameter or create the directory." -ForegroundColor Yellow
    exit 1
}

# Get all server directories
$servers = Get-ChildItem -Path $ServerPath -Directory
if ($servers.Count -eq 0) {
    Write-Host "No servers found in $ServerPath" -ForegroundColor Yellow
    exit 0
}

# Display available servers
Write-Host "Available Servers:" -ForegroundColor Green
Write-Host ""
for ($i = 0; $i -lt $servers.Count; $i++) {
    Write-Host "  [$($i + 1)] $($servers[$i].Name)" -ForegroundColor White
}
Write-Host ""
Write-Host "  [0] Exit" -ForegroundColor Gray
Write-Host ""

# Get user selection
do {
    $selection = Read-Host "Select a server (0-$($servers.Count))"
    $validInput = $selection -match '^\d+$' -and [int]$selection -ge 0 -and [int]$selection -le $servers.Count
    if (-not $validInput) {
        Write-Host "Invalid selection. Please try again." -ForegroundColor Red
    }
} while (-not $validInput)

$selection = [int]$selection

# Exit if user chose 0
if ($selection -eq 0) {
    Write-Host "Exiting..." -ForegroundColor Gray
    exit 0
}

# Get selected server
$selectedServer = $servers[$selection - 1]
$serverFullPath = $selectedServer.FullName

Write-Host ""
Write-Host "Selected: $($selectedServer.Name)" -ForegroundColor Cyan
Write-Host "Path: $serverFullPath" -ForegroundColor Gray
Write-Host ""

# Check for FXServer.exe
$fxServerPath = Join-Path $serverFullPath "FXServer.exe"
if (-not (Test-Path $fxServerPath)) {
    Write-Host "Warning: FXServer.exe not found in server directory" -ForegroundColor Yellow
    Write-Host "Opening server folder..." -ForegroundColor Yellow
    Start-Process explorer.exe $serverFullPath
    exit 0
}

# Ask what to do
Write-Host "Options:" -ForegroundColor Green
Write-Host "  [1] Start Server" -ForegroundColor White
Write-Host "  [2] Open Server Folder" -ForegroundColor White
Write-Host "  [3] View Server Config" -ForegroundColor White
Write-Host "  [0] Cancel" -ForegroundColor Gray
Write-Host ""

$action = Read-Host "Select action"

switch ($action) {
    "1" {
        Write-Host ""
        Write-Host "Starting $($selectedServer.Name)..." -ForegroundColor Green
        Set-Location $serverFullPath
        Start-Process -FilePath $fxServerPath
        Write-Host "Server started!" -ForegroundColor Green
    }
    "2" {
        Write-Host "Opening folder..." -ForegroundColor Cyan
        Start-Process explorer.exe $serverFullPath
    }
    "3" {
        $configPath = Join-Path $serverFullPath "server.cfg"
        if (Test-Path $configPath) {
            Write-Host "Opening server.cfg..." -ForegroundColor Cyan
            Start-Process notepad.exe $configPath
        } else {
            Write-Host "server.cfg not found" -ForegroundColor Red
        }
    }
    default {
        Write-Host "Cancelled" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "Done!" -ForegroundColor Cyan
