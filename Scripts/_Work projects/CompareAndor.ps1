# Define the paths to the CSV files
$csvFile1 = "path\to\your\first\file.csv"
$csvFile2 = "path\to\your\second\file.csv"

# Import the CSV files using ImportExcel
$data1 = Import-Excel -Path $csvFile1
$data2 = Import-Excel -Path $csvFile2

# Define the column to compare
$column = "Name"

# Find names present in both files
$commonNames = $data1.$column | Where-Object { $data2.$column -contains $_ }

# Find names present only in the first file
$namesOnlyInFile1 = $data1.$column | Where-Object { $data2.$column -notcontains $_ }

# Find names present only in the second file
$namesOnlyInFile2 = $data2.$column | Where-Object { $data1.$column -notcontains $_ }

# Output the results
$results = [PSCustomObject]@{
    CommonNames = $commonNames
    NamesOnlyInFile1 = $namesOnlyInFile1
    NamesOnlyInFile2 = $namesOnlyInFile2
}

$results | Export-Excel -Path "path\to\output\names_comparison.xlsx" -AutoSize
