# variable to hold the utilities module preference
$UtilitiesProgress='SilentlyContinue'

function Get-UtilitiesProgressPreference {
    $UtilitiesProgress
}

function Set-UtilitiesProgressPreference {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet('SilentlyContinue','Continue')]
        $Preference
    )
    $Script:UtilitiesProgress=$Preference
}

function Get-Webfile {
    param(
        [Parameter(Mandatory)]
        [string]$uri,
        [Parameter(Mandatory)]
        [string]$OutFile
    )
    # Save current preference
    $pref=$Global:ProgressPreference
    # Yse the module preference
    $Global:ProgressPreference=$UtilitiesProgress
    Invoke-WebRequest -Uri $uri -OutFile $OutFile
    # Restore preference
    $Global:ProgressPreference=$pref
}