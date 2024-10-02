
# Define the paths to the CSV files
$csv1Path = "C:\Users\Mitchell.Woodward\OneDrive - Shape Australia\Baggage\SDP1.csv"
$csv2Path = "C:\Users\Mitchell.Woodward\OneDrive - Shape Australia\Baggage\BB1.csv"

# Import the CSV files
$csv1 = Import-Csv -Path $csv1Path
$csv2 = Import-Csv -Path $csv2Path

# Extract email addresses
$emails1 = $csv1.EmailAddress
$emails2 = $csv2.UserEmail

# Find emails that are in csv1 but not in csv2
$uniqueToCsv1 = $emails1 | Where-Object { $_ -notin $emails2 }

# Find emails that are in csv2 but not in csv1
$uniqueToCsv2 = $emails2 | Where-Object { $_ -notin $emails1 }

# Combine the results
$uniqueEmails = $uniqueToCsv1 + $uniqueToCsv2

# Output the unique emails
$uniqueEmails | ForEach-Object { Write-Output $_ }

$uniqueEmails | Export-Excel -Path "C:\Users\Mitchell.Woodward\OneDrive - Shape Australia\Baggage\output.xlsx" -AutoSize





