$Serverlistfilepath="C:\Users\mndwo\OneDrive - Shape Australia\Baggage\Scripts\Servernames.csv"

$Serverlist=Import-Csv -Path $Serverlistfilepath

foreach ($Server in $Serverlist){
 $servername=$Server.Servername
   $Laststatus=$server.Laststatus

   $connection= Test-Connection $server.servername -count 1

    if ($connection.status -eq "Success"){
    Write-Output "$($servername) is online"
    }else {
        Write-Output "$($servername)is offline"
        }
    }