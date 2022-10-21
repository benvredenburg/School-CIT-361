<#
Program Name : rps.ps1
Date: 10/03/2022
Author: Benjamin Vredenburg
Course: CIT361
I, Benjamin Vredenburg, affirm that I wrote this script as original work completed by me.
#> 
Clear-Host

# Ask User for their name and greet them.
$user = Read-Host "What is your name?"
Write-Host
Write-Host "Let's play a game of rock, paper, scissors."
Write-Host

# Create counting variables for loops.
$playGame = 'yes'
$roundCount = 0
$compRoundWins = 0
$userRoundWins = 0
$compGameWins = 0
$userGameWins = 0

# Begin loop to start and continue games per user decision.
while ($playGame -eq 'yes') {    

    # Begin a loop that will end once the $roundCount variable reachs three rounds played (excluding ties).
    while ($roundCount -lt 3) {

        # Have the script choose rock, paper, or scissors randomly from a list and store it in a variable.
        $compChoice = 'rock', 'paper', 'scissors' | Get-Random

        # Reset $userChoice to null.
        $userChoice = ''

        # Prompt the user to select rock (r), paper (p), or scissors (s).
        while ($userChoice -ne 'rock' -and $userChoice -ne 'paper' -and $userChoice -ne 'scissors') {
            $userChoice = Read-Host "Please select rock (r), paper (p), or scissors (s)"

            # The User's answer will be converted to 'rock,' 'paper,' or 'scissors' and stored in a variable
            if ($userChoice -eq 'r' -or $userChoice -eq 'rock') {
                $userChoice = 'rock'
            }elseif ($userChoice -eq 'p' -or $userChoice -eq 'paper') {
                $userChoice = 'paper'      
            }elseif ($userChoice -eq 's' -or $userChoice -eq 'scissors') {
                $userChoice = 'scissors'
            }else {
                continue
            } 
        }

        # Determine a winner and update the appropriate counters
        if ($userChoice -eq 'rock' -and $compChoice -eq 'paper') {
            Write-Host $compChoice "covers" $userChoice"!"  "You lose this round."
            $compRoundWins++
            $roundCount++
            Write-Host
        }elseif ($userChoice -eq 'rock' -and $compChoice -eq 'scissors') {
            Write-Host $userChoice "smashes" $compChoice"!" "You win this round."
            $userRoundWins++
            $roundCount++
            Write-Host
        }elseif ($userChoice -eq 'paper' -and $compChoice -eq 'rock') {
            Write-Host $userChoice "covers" $compChoice"!" "You win this round."
            $userRoundWins++
            $roundCount++
            Write-Host
        }elseif ($userChoice -eq 'paper' -and $compChoice -eq 'scissors') {
            Write-Host $compChoice "cuts" $userChoice"!" "You lose this round."
            $compRoundWins++
            $roundCount++
            Write-Host
        }elseif ($userChoice -eq 'scissors' -and $compChoice -eq 'rock') {
            Write-Host $compChoice "smashes" $userChoice"!" "You lose this round."
            $compRoundWins++
            $roundCount++
            Write-Host
        }elseif ($userChoice -eq 'scissors' -and $compChoice -eq 'paper') {
            Write-Host $userChoice "cuts" $compChoice"!" "You win this round"  
            $userRoundWins++
            $roundCount++  
            Write-Host
        }else {
            Write-Host $compChoice "ties" $userChoice"!" "You tie this round"
            Write-Host
        }
    }

    # Inform user of the outcome of the game and update the appropriate counters.
    if ($compRoundWins -gt $userRoundWins) {
        Write-Host "You have lost this game"
        $compGameWins++
        Write-Host
    }else {
        Write-Host "You have won this game"
        $userGameWins++
        Write-Host
    }

    # Reset counters.
    $roundCount = 0
    $compRoundWins = 0
    $userRoundWins = 0

    # Ask user for another round and restart loop if the answer is yes. End game if the answer is no.
    Write-Host
    $playGame = Read-Host "Would you like to play again?"
    Write-Host

    if ($playGame -eq 'yes') {
        continue
    }else {

    # If the game is ended, provide statistics to the user and declare a winner of the match.
    Write-Host   

    Write-Host "Computer: " $compGameWins

    Write-Host $user ": " $userGameWins

    if ($compGameWins -gt $userGameWins) {
        Write-Host "You have lost the match"
    }elseif ($userGameWins -gt $compGameWins) {
        Write-Host "You have won the match"
    }else {
        Write-Host "The match is a tie"
    }
}
}

