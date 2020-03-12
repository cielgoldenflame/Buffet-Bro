function Typeit {
    foreach ($ch in $string.ToCharArray()){
        Write-Host "${ch}" -NoNewline
        Start-Sleep -Milliseconds 75
    }
    Write-Host "" 
}

Clear-Host

[string]$string = "A road intersects the sidewalk adead; cars are streaming out, without regard to pedestrians. 
Will you risk crossing, or will you wait?"
Typeit