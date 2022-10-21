<#
Program Name : Loop-da-loops.ps1
Date: 09/26/2022
Author: Benjamin Vredenburg
Course: CIT361
I, Benjamin Vredenburg, affirm that I wrote this script as original work completed by me.
#> 

#Assign a string of your name to the $name variable
$name='Benjamin Vredenburg'

Clear-Host
Write-Host "Begin output for $name" -ForegroundColor Green

#While loop that outputs the numbers 5-10  in the format of 'Number #'
'While 5-10';'=' * 80
#Your code Here
$number1=5
while($number1 -lt 11) {
    Write-Host "Number $number1"
    $number1=$number1+1
}


#Do While loop that outputs the numbers from 100-150 counting by 10 in the format 'Number #'
'';'Do while 100-150 by 10s';'=' * 80
#Your code Here
$number2=100
do {
    Write-Host "Number $number2"
    $number2=$number2+10
}while ($number2 -gt 99 -and $number2 -lt 151)

#Do Until loop that outputs the numbers from 1000 to 1500 counting by 100 in the format 'Number #'
'';'Do until 1000-1500 by 100s';'=' * 80
#Your code Here
$number3=1000
do {
    Write-Host "Number $number3"
    $number3=$number3+100
} until($number3 -gt 1500)

#For loop that outputs the numbers from -5 to -10  in the format 'Number #'
'';'For -5 to -10';'=' * 80
#Your code Here
for($number4=-5; $number4 -gt -11; $number4--){
    Write-Host "Number $number4"
}

#Foreach loop that gets a list of files from the current directory and outputs the name and size in KB
'';'Foreach directory';'=' * 80
#Your code Here
foreach($file in Get-ChildItem) {
    Write-Host $file ((Get-Item $file).Length/1KB)
}

#Any loop that outputs the numbers from 1 to 10 skipping every third number using continue in the format 'Number #'
'';'Continue 1 to 10 skipping every third number';'=' * 80
#Your code Here
$number5=0
while ($number5 -lt 10)
{
    $number5=$number5+1
    if ($number5 % 3 -eq 0)
    {
        continue
    }
    
    Write-Host "Number $number5"
    
}



Write-Host "This concludes the output for $name" -ForegroundColor Green