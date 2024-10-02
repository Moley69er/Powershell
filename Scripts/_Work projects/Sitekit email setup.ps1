
# Path to the CSV file
$csvPath = "C:\Users\Mitchell.Woodward\OneDrive - Shape Australia\Baggage\Scripts\sitekitname.csv"

# Import the CSV file
$names = Import-Csv -Path $csvPath

# Loop through each name in the CSV
foreach ($name in $names) {
    # Create a new distribution list
    $dlName = $name.Name
    $dlAlias =$name.Alias
    #New-DistributionGroup -Name $dlName -Alias $dlAlias -Type Distribution
    Write-Output "Created distribution list: $dlName, $dlalias"
}
