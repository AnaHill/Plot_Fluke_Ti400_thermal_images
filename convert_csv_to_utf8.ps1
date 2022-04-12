# Reads all .csv files from the current folder and sets their encoding to UTF8
# Saves original .csv files as <original_filename>org.csv and 
# UTF8 encoded files as <original_filename>.csv
# .\fresh_start.ps1 clear

Write-Host "`nConverting all .csv files encoded in unicode to UTF8"
$Dir = get-childitem #-recurse # without recurse, only .csv files in the current folder are considered
$List = $Dir | where {$_.extension -eq ".csv"}
$listname = 'Found ' + $List.Length + ' following .csv files'
Write-Host $listname -NoNewLine
$List | format-table name

# for conditon: -lt = less than, -le = less than or equal
Write-Host "Encoding files:" 
Write-Host "First, renaming original files <original_filename>.csv as <original_filename>org.csv"
Write-Host "Then, encoding <original_filename>org.csv files to UTF and save as <original_filename>.csv`n"
for ($num = 0 ; $num -lt $List.Length ; $num++)
{    
$orgname = [System.IO.Path]::GetFileNameWithoutExtension($List.Name.Get($num))
$renamed_orginal=$orgname + 'org.csv'
$org_file = $orgname + '.csv'
# renaming original files as <original_filename>org.csv
Rename-Item $org_file $renamed_orginal
$message = $org_file + " converted to " + $renamed_orginal
Write-Host $message
# encoding original files in UTF8 and saved as <original_filename>.csv
Get-Content $renamed_orginal -Encoding Unicode | Set-Content -Encoding UTF8 $List.Name.Get($num)
$message  = $renamed_orginal + ' encoded in utf8 and saved as ' + $List.Name.Get($num)
Write-Host $message


}

