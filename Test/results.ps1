if ($hp -le 0) `
{
    $qp = 101
    .\quest.ps1
}elseif ($slime -le 0) `
{
    $qp = 55
    .\quest.ps1
}elseif ($es -eq 1) `
{
    Clear-Host
    $qp = 40
    .\quest.ps1
}