<#
Program Name: hello.ps1
Date: 09/26/2022
Author: Benjamin Vredenburg
Course: CIT361
I, Benjamin Vredenburg, affirm that I wrote this script as original work completed by me.
#>

$name=Read-Host "What is your name?"
Write-Host "Good day $name. It is $(Get-Date)."