while ($slime -gt 0 -and $hp -gt 0) `
{
    Clear-Host;
    Read-Host -Prompt "A slime is before you!
Your health is $hp. The slime's health is $slime. 
What will you do? (attack/run)" | ForEach-Object `
    {
        if ($_ -eq 'attack') `
        {
            $slime = $slime - (Get-Random -Minimum 0 -Maximum 10);
            $hp = $hp - (Get-Random -Minimum 0 -Maximum 5)
        }elseif ($_ -eq 'run') `
        {
            Get-Random -Minimum 0 -Maximum 9 | ForEach-Object `
            {
                if($_ -lt '4') `
                {
                    Clear-Host;
                    Write-Output "You cannot escape!";
                    Pause;
                }else `
                {
                    Clear-Host;
                    Write-Output "You got away safely!";
                    Pause;
                    [int]$es = 1;
                    break
                }
            }
        }
    }
}
.\results.ps1