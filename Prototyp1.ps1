$csv = Import-Csv -Path "C:\temp\Projekt_DB2.csv" -Delimiter ";" 

$IDs = $csv.ID
$Mannschaften = $csv.Mannschaft


$i = 0;
ForEach ($Mannschaft in $Mannschaften)
{
    $i++
    
    
    if ($i -lt 10) {
    $test = $i.ToString() + "   " +  $Mannschaft
    $test
    }

    if ($i -ge 10) {
    $test = $i.ToString() + "  " +  $Mannschaft
    $test
    }

}

[int]$IDA = Read-Host "Geben Sie die Heimmannschaft an."
[int]$IDB = Read-Host "Geben Sie die Gastmannschaft an."

if (($IDA -match "^[\d\.]+$") -and ($IDB -match "^[\d\.]+$") -and ($IDA -ne $IDB))
{
    Write-Host "Ihr Ergebnis wird berechnet."
}
else
{
    Write-Host "Bitte geben Sie eine gültige Zahl von 1-18 ein."
}


[int]$ZeileA = $IDA 
[int]$ZeileB = $IDB 

$Gesamtstaerken = $csv.Gesamt

$i = 0;
ForEach ($Gesamt in $Gesamtstaerken)
{
    $i++
    
    if ($i -eq $ZeileA) {
    [double]$GesamtA = $Gesamt
    }
}



$Gesamtstaerken = $csv.Gesamt

$i = 0;
ForEach ($Gesamt in $Gesamtstaerken)
{
    $i++
    
    if ($i -eq $ZeileB) {
    [double]$GesamtB = $Gesamt
    }
}

[double]$GesamtAA = $GesamtA * 1.05
[double]$Diff = $GesamtAA - $GesamtB
$Diff


if ($Diff -gt 1)
{
    "Die Heimmannschaft gewinnt."
}
elseif ($Diff -lt -1)
{
    "Die Gastmannschaft gewinnt."
}
else
{
    "Die Mannschaften trennen sich unentschieden"
}





