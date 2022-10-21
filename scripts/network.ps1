<#
Program Name : network.ps1
Date: 10/19/2022
Author: Benjamin Vredenburg
Course: CIT361
I, Benjamin Vredenburg, affirm that I wrote this script as original work 
completed by me.
#> 

# Clear Screen.
Clear-Host

    # Receive IP address and subnet inputs from user. Store them as a string 
    # variable. 
    $IPAddress1=read-host "Please enter first IP address (xxx.xxx.xxx.xxx)"
    $IPAddress2=read-host "Please enter second IP address (xxx.xxx.xxx.xxx)"
    $subnetMask=read-host "Please enter the subnet mask (xxx.xxx.xxx.xxx)"
    Write-Host


# Get-IPNetwork function
function Get-IPNetwork ($IPAddress, $SubnetMask) {
# Try Catch to ensure proper input
    try {
        [ipaddress]$IPAddress=$IPAddress
        [ipaddress]$SubnetMask=$SubnetMask
        # Create IPAddress objects from user input.
        [ipaddress]$netID=$IPAddress.Address -band $SubnetMask.Address
        # Return Network IDs to user.
    } 
    catch { # If input can't be converted to an IPAddress object, throw error with catch statement.
        write-host "One or more of your inputs could not be translated into an IPAddress object"   
        Write-Host
        exit
    }  
    return $netID
}
# Test-IPNetwork function
function Test-IPNetwork ($IP1, $IP2, $SubnetMask) {
    $netID1=Get-IPNetwork $IP1 $subnetMask
    $netID2=Get-IPNetwork $IP2 $subnetMask
    $netID1
    $netID2

    write-host "Are they on the same network?"
    if (($netID1.Address -band $SubnetMask.Address) -eq ($netID2.Address -band $SubnetMask.Address)) {
        $true
    }
    else {
        $false
    }
}

Test-IPNetwork $IPAddress1 $IPAddress2 $subnetMask