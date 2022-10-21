<#
Program Name : color.ps1
Date: 10/10/2022
Author: Benjamin Vredenburg
Course: CIT361
I, Benjamin Vredenburg, affirm that I wrote this script as original work 
completed by me.
#> 
# Clear screen for game.
Clear-Host

# Ask user for their name and greet them.
$user = Read-Host "What is your name?"
Write-Host

# Define Variables
[string[]]$SystemColors=[System.Enum]::GetValues([System.ConsoleColor])
$color=$SystemColors | Get-Random
$SysColorOutput=[System.Enum]::GetValues([System.ConsoleColor]) -join ', '
$wrongArray=@()
$attemptsNeeded=0
$playAgain='y'

# Loop through game until user declines a new game.
While($playAgain -eq 'y') {

    # Ask the user, by name, to guess a color. 
    Write-Host "Hello $user, can you guess my favorite color?"
    Write-Host
    # Begin stopwatch.
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    
    # Loop through user's turn until they guess the correct color.
    While($userChoice -ne $color){

        # Store the user's input in a variable. Explain the options available to user.
        $userChoice = Read-Host "Please Guess a valid color, 'q' to quit, 'colors' to 
receive a list of valid color choices, 'hint' to receive 
a hint, or 'list' to receive a list of previous guesses"
        Write-Host    

        # Provide a mechanism for the user to quit at any time during a round.
        if($userChoice -eq 'q') {
            Write-Host
            Write-Host "Exiting"
            exit
        }
        # Provide a mechanism for the user to see a list of valid color choices.
        elseif($userChoice -eq 'colors'){
            Write-Host
            Write-Host "$SysColorOutput"
            Write-Host
        }
        # Provide a mechansim for the user to see a list of previous guesses.
        elseif($userChoice -eq 'list') {
            Write-Host
            Write-Host "You have made the previous guesses: $wrongArray"
            Write-Host
        }
        # Provide a mechanism to give the user a hint. The hint will provide the first
        # letter of the correct color. If the correct color starts with 'Dark', give 
        # the user a hint that says dark(x), where x is the color.
        elseif($userChoice -eq 'hint') {
            Write-Host "Okay, here's a hint: " -NoNewline
            $hint1 = $color.ToString().Substring(0,1)
            if($hint1 -eq 'D'){
                Write-Host $color.ToString().Substring(0,5)  
                Write-Host          
            }else{
                Write-Host $hint1
                Write-Host
            }
   
        }
        # If user inputs anything other than a listed valid color, inform them and ask
        # them guess again.
        elseif($userChoice -notin $SystemColors) {
            Write-Host "$userChoice is not a valid choice, please try again"
            Write-Host
            continue
        }
        # If user guesses wrong, inform them that the color they chose was incorrect
        # by color name and text color, and ask them to guess again.
        elseif($userChoice -ne $color) {
            Write-Host "I'm sorry, but " -NoNewline
            Write-Host $userChoice -ForegroundColor $userChoice -NoNewline 
            Write-Host " is not correct"
            Write-Host
            # After each wrong guess, add the guess into an array to be displayed on demand.
            $wrongArray+=$userChoice
            # After each wrong guess, increase the attemptsNeeded counter.
            $attemptsNeeded++
        }
        # If user guesses correctly, inform them that the color they chose was correct
        # by color name and text color. Congratulate them and end the round.
        else {
            Write-Host "Congratulations, " -NoNewline 
            Write-Host "$userChoice " -ForegroundColor $userChoice -NoNewline
            Write-Host "is Correct!"
            Write-Host
            # Increase the attemptsNeeded counter one last time.
            $attemptsNeeded++
        }
        
    }

    # Provide the user with the number of attempts they needed to guess the color.
    Write-Host "You required $attemptsNeeded attempts to guess my color, and you 
took the following amount of time to guess my color"

    # Provide the user with the amound of time that has elapsed since beginning the round.
    $stopwatch.elapsed
    # Stop the stopwatch to avoid using system resources.
    $stopwatch.Stop()
    
    # Reset variables for next iteration of the loop.
    $color=$SystemColors | Get-Random
    $attemptsNeeded=0
    $wrongArray=@()
    # After the round is over, give the user the option to play again.
    $playAgain = Read-Host "Would you like to play again? (y/n)"
}






