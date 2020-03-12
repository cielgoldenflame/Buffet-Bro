#Variables
#$null anything with no value
#$global is a scope that is in effect when PS starts. Variables and functions are 
#present when PS starts up when a global scope is created.
$global:personCharacter = $null
$global:startGame = $true

#Clear the console of everything
clear-host 

#function is a list of PS statements that has a name that I assign
function Character-Selection()
{
#Clear the console of everything
clear-host

#Write-Host command customizes the output
Write-Host "*******************"
Write-Host " Pick a Buffet Bro "
Write-Host "     A: Chris      "
Write-Host "     B: Henry      "
Write-Host "     C: Josh       "
Write-Host "     D: Kiana      "
Write-Host "*******************"

#Read-Host command reads a line of input from the console and prompts user for input. Save
#input as a string

$playerChoice = Read-Host -Prompt " Choose your Bro"

#Switch is used to check a condition in a script, particularly multiple conditions and
#is equivalent to a series of If statements.

Switch ($playerChoice)
{
    A {$global:personCharacter = "Chris"}
    B {$global:personCharacter = "Henry"}
    C {$global:personCharacter = "Josh"}
    D {$global:personCharacter = "Kiana"}
    default {$global:personCharacter = "Kiana"}
}
Write-Host "You selected $global:personCharacter, let's go to the buffet!"
Write-Host "Press Any Key to Continue or Q to go back to class"
#Sleep delays the next set of commands
Start-Sleep 300
}
while($true)
{ 
    
  Character-Selection
    if(!$global:runGame)
    {
        break
    }
}