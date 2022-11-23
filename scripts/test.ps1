Clear-Host

function Get-MACVendor {
    <#
    .Synopsis
    This function takes a database txt file to check first six hex to a vendor list
    #>
    
    param (
        [Parameter(Mandatory)]$DataBasePath,
        $MACAdress
    )
    $Data = Get-Content $DataBasePath
    $MACAdress = '68-94-23-09-6A-F8'
    $PathTestData = Test-Path -Path $DataBasePath
    if ($PathTestData -eq $true) {



        class MAC {
            [string]$arrayMac
            [string]$ShortName
            [string]$Name 
        }
        $mac = [MAC]::new()
        $Data = Get-Content $DataBasePath
        Write-Host 'data is'$Data[0] 

        $Data = $Data -split '`t'
        Write-Host 'data is'$Data 

        $Data = ForEach-Object { [MAC]$_ }
        Write-Host 'data is'$Data 
        $mac | Sort-Object $Name

            if ($null -ne $MACAdress) {
                foreach ($line in $Data) {
                    $Object = $line -split '`t'
                    $listAdress = $Object[0] 
                    $ShortName = $Object[1]
                    $FullName = $Object[2] 
                    $arrayMac = $MACAdress -split '-'
                    $DevVendorMac = $arrayMac[0, 1, 2] -join ':'
                    $VendorName = Select-Object -InputObject $Data 
                    $VendorName
                }
            }
            else{Get-NetAdapter | ft MacAddress
                foreach ($Content in $Data) {
                    $Object = $Content -split "`t"
                    $MACAdress = $Object[0] 
                    $Name = $Object[1]
                    $FullName = $Object[2] 
            
                }
            }
    }
    else {
        Write-Host "Path for Mac Vendors is invalid!"
    }
}
# Group songs by album then sort alphabetically by title. List albums by year newest to oldest in the report. 

function Format-Songs { 
    <#
    .Synopsis
    This comand function sorts music. first pramater is file location. secound parameter is the location that the file will go
    #>
    param (
        [Parameter(Mandatory)]$DataBasePath,   
        $Path
    )
    if ((Test-Path -Path $DataBasePath) -eq $true) {
        $Data = Get-Content $DataBasePath
        foreach ($line in $Data) {
            $Object = $line -split "`t"
            $Song = $Object[0] 
            $Album = $Object[1]
            [int]$Year = [int]$Object[2]
            $value = "'$($Album) ($($year)) `n `t'$Song"
            # check if $Path param was entered if true create file to $Path
            if ( $null -eq $Path) {
                Write-Output $value
            }
            #check if $Path is a vaild path if true make file in current directory
            elseif ((Test-Path -Path $Path) -eq $true) {
                add-Content -Path $Path -Value $value
            }
            else {
                Write-Host "Path is invalid! $Path" -f Red 
            }
        }
    }
    else {
        Write-Host "Path for songs is invalid! $DataBasePath" -f Red 
    }

}