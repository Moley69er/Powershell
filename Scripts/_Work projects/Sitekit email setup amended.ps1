
#This Script will create email Distribution lists via the exchange-online PS module in conjuntion with the excel-import module
#You will need to sign in with your admin credentials, you should see the popup in your internet browser
#if you do not have the import-excel or the exchange-online modules the script will check if you need to install them from the PS gallery
#and begin start the install

# Check if ImportExcel module is installed, if not, install it
if (-not (Get-Module -Name ImportExcel -ListAvailable)) {
    Install-Module -Name ImportExcel -RequiredVersion 5.4.2 -force
}

# Check if ExchangeOnlineManagement module is installed, if not, install it
if (-not (Get-Module -Name ExchangeOnlineManagement -ListAvailable)) {
    Install-Module -Name ExchangeOnlineManagement -Force
}

# Establish a session with Exchange Online
Connect-ExchangeOnline

# Path to the CSV file | this can be a excel file instead by using import-excel as a replacement and amending appropriately
#Amend the path to your enviroment 
$csvPath = "C:\Users\Mitchell.Woodward\OneDrive - Shape Australia\Baggage\Scripts\Mine\Work projects\sitekitname.csv"

# Import the CSV file
$names = Import-Csv -Path $csvPath 

# Loop through each name in the CSV
foreach ($name in $names) {
    $dlName = ($name.Name).Trim()
    $dlAlias = ($name.Alias).Trim()
    #This will create all the Distribution Groups from the imported data set.
    #Common errors are existing emails or not having admin enabled when run from terminal
    New-DistributionGroup -Name $dlName -Alias $dlAlias 
    #Created emails default to old shape SMTP as such we need to change it to Shape.com.au
    # This is an exchange "quirk" and cannot be changed
    Set-distributiongroup -Identity $dlAlias -PrimarySmtpAddress "$dlAlias@shape.com.au"
    Write-Host "Created distribution list: $dlName, $dlalias"
}

# Close the session with Exchange Online
Disconnect-ExchangeOnline