<#
.SYNOPSIS
    Automated System Health Check Script
.DESCRIPTION
    This script gathers basic system health information (OS version, Disk Space, Memory, and Uptime) 
    and outputs it to a text file on the desktop. Useful for Level 1 Helpdesk diagnostics.
.AUTHOR
    Hartmut Kirsch
#>

$Date = Get-Date -Format "yyyy-MM-dd_HH-mm"
$OutputFile = "$env:USERPROFILE\Desktop\SystemHealthReport_$Date.txt"

# Add a header to the text file
"========================================" | Out-File $OutputFile
"       SYSTEM HEALTH REPORT             " | Out-File $OutputFile -Append
"       Date: $Date                      " | Out-File $OutputFile -Append
"========================================" | Out-File $OutputFile -Append
"" | Out-File $OutputFile -Append

# 1. Get Operating System Info
"--- OPERATING SYSTEM ---" | Out-File $OutputFile -Append
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version | Out-File $OutputFile -Append

# 2. Get Uptime (To check if the user actually restarted their PC!)
"--- SYSTEM UPTIME ---" | Out-File $OutputFile -Append
$OS = Get-CimInstance Win32_OperatingSystem
$Uptime = (Get-Date) - $OS.LastBootUpTime
"Days: $($Uptime.Days), Hours: $($Uptime.Hours), Minutes: $($Uptime.Minutes)" | Out-File $OutputFile -Append
"" | Out-File $OutputFile -Append

# 3. Get Disk Space (C: Drive)
"--- DISK SPACE (C: Drive) ---" | Out-File $OutputFile -Append
Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" | 
    Select-Object DeviceID, 
    @{Name="FreeSpace(GB)";Expression={[math]::Round($_.FreeSpace / 1GB, 2)}},
    @{Name="TotalSize(GB)";Expression={[math]::Round($_.Size / 1GB, 2)}} | 
    Out-File $OutputFile -Append

# 4. Get Available Memory (RAM)
"--- AVAILABLE MEMORY ---" | Out-File $OutputFile -Append
$RAM = Get-CimInstance Win32_OperatingSystem
$FreeRAM = [math]::Round($RAM.FreePhysicalMemory / 1024, 2)
"Free Physical Memory: $FreeRAM MB" | Out-File $OutputFile -Append

Write-Host "Health check complete! Report saved to your Desktop." -ForegroundColor Green
