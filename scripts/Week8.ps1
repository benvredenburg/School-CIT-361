<#
Program Name : Week8.ps1
Date: 10/31/2022
Author: Benjamin Vredenburg
Corse: CIT361
I, Benjamin Vredenburg, affirm that I wrote this script as original work completed by me.
#> 

# Create a function Named Get-MACVendor that returns the Vendors Full Name.
function Get-MACVender () {

<# 
The script takes one optional argument 
$MACAddress and one Mandatory argument $DatabasePath
If a MAC address is specified return the Vendor of that MAC address
If the MAC address is not supplied discover the MAC addresses of the 
network adapters on the computer and look up the Vendor of each address. 
Return Each Vendor Name. 
#>
    param (
        [Parameter(Mandatory)]
        [string]$DatabasePath,
        [string]$MACAddress
    )

# The DatabasePath accepts filename of the database to use. 
# Don’t assume a directory location.
    try{
        $data = Get-Content $DatabasePath -ErrorAction Stop
    }

# Throw an error if the database file can’t be found
    catch{
        Write-Host "Could not find The Database file"
    }

# Test if user is on Linux and adjust if they are
    if ($isLinux -eq $true) {
        if ($MACAddress -like '????????') {
            $macs = $MACAddress -replace "-", ":"
            $data | Select-String $macs.substring(0, 8)
        }
        else {
            $macs = ip address | grep ether
            $data | Select-String $macs.substring(0, 8)
        }
    }
    else {
        if ($MACAddress -like '????????') {
            $macs = $MACAddress -replace "-", ":"
            $data|Select-String $macs.substring(0, 8)
        }
        else {
            $macs = (Get-NetAdapter|ForEach-Object Macaddress) -replace "-", ":"
            $data|Select-String $macs.substring(0, 8)
        }
    }
}

<#
Create A function named Format-Songs that retrieves and formats 
the song data from psfiles/data/RushSongs.txt
#>
function Format-Songs () {
<#
The script takes one mandatory and one optional arguments

$DatabasePath (madatory) is the file that contains the song information
$Path is the file to save the output to, if missing just return report to 
output stream. 
#>
    param(
        [Parameter(Mandatory)]
        [string]$DatabasePath,
        [string]$Path
    )
    $Path = "$databasepath" + "\..\RushOutput.txt"

# Throw an error if the database can’t be found or the file can’t be saved.
    try {
        $data = Import-Csv $DatabasePath -Delimiter "`t" | Group-Object album -ErrorAction Stop
    }
    catch {
        Write-Host 'Could Not find file'
    }

# Group songs by album then sort alphabetically by title.
    $songs=""
    for ($i=0; $i -lt $data.length; ++$i) {
        Write-Host $data[$i].group[0].album  " ("$data[$i].group[0].year")"
        $songs +=  $data[$i].group[0].album + " ("+$data[$i].group[0].year+")"
        $songs += "`r`n"
        foreach ($song in $data[$i].Group.song) {
            Write-Host "      $song"
            $songs +=  "      $song `r`n"
        }
    }
    Write-Host $songs
    try {
        $songs | Out-File $Path
    }
    catch {
        Write-Host "Could not Save file"
    }
}