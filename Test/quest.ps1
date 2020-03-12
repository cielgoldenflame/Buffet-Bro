#Code for Quest Progression
#Plan While loop 

while ($qp -lt 100) `
{
    if ($qp -eq 10) `
    {
        Clear-Host
        Write-Output "Progress $qp"
        Pause
        $qp = 20
    }elseif ($qp -eq 20) `
    {
        Clear-Host
        Write-Output "Progress $qp"
        Pause
        $qp = 30  
    }elseif ($qp -eq 30) `
    {
        Clear-Host
        Write-Output "Progress $qp"
        Pause
        $qp = 40
    }elseif ($qp -eq 40) `
    { 
        Clear-Host
        Write-Output "Progress $qp"
        Pause
        $qp = 50
    }elseif ($qp -eq 50) `
    {#Slime Encounter
        .\combat.ps1
    }elseif ($qp -eq 55) `
    {
        Clear-Host;
        $ua = Read-Host "You have defeated the slime. Pick a direction. (left/right/back)"
        if ($ua -eq 'right') {
            $qp = 100
        }
    }elseif ($qp -eq 60) `
    {
        
    }elseif ($qp -eq 70) `
    {
        
    }elseif ($qp -eq 80) `
    {
        
    }elseif ($qp -eq 90) `
    {
        
    }
}
if ($qp -eq 101){
    Clear-Host
    Write-Output "YOU DIED"
    $rs = Read-Host "Restart (Y/N)"
    if ($rs -eq 'n') {
        break
    }elseif ($rs -eq 'y') {
        .\main.ps1
    }
}elseif ($qp -eq 100) `
{
    Clear-Host
    Write-Output "You've Won!"
    Pause
    break
}