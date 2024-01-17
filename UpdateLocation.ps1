$csvPath1 = ".\users.csv"
$csvPath2 = ".\itusers.csv"

function UpdateLocation {
    param (
        [string] $csvPath
    )

    $csvFile = Import-Csv -path $csvPath1


    foreach ($row in $csvFile){
        $ObjectId = $row.MailNickName + "@awakenservices.net"
        $user = Get-AzureADUser -ObjectId $ObjectId

        Set-AzureADUser -ObjectId $user.ObjectId -PhysicalDeliveryOfficeName "Remote"
        Write-Host "Successfully updated Office Location for $ObjectID" -ForegroundColor Green
    }
    
}

UpdateLocation -csvPath $csvPath1

function ITUpdateLocation {
    param (
        [string] $csvPath
    )

    $csvFile = Import-Csv -path $csvPath2


    foreach ($row in $csvFile){
        $ObjectId = $row.MailNickName + "@awakenservices.net"
        $user = Get-AzureADUser -ObjectId $ObjectId

        Set-AzureADUser -ObjectId $user.ObjectId -PhysicalDeliveryOfficeName "ITAccount"
        Write-Host "Successfully updated Office Location for $ObjectID" -ForegroundColor Green
    }
    
}
ITUpdateLocation -csvPath $csvPath2

#this function will help us reverse the Office location name to empty
function ReverseLocation {
    param (
        [string] $csvPath
    )

    $csvFile = Import-Csv -path $csvPath1


    foreach ($row in $csvFile){
        $ObjectId = $row.MailNickName + "@awakenservices.net"
        $user = Get-AzureADUser -ObjectId $ObjectId

        Set-AzureADUser -ObjectId $user.ObjectId -PhysicalDeliveryOfficeName " "
        Write-Host "Successfully reversed Office Location for $ObjectID" -ForegroundColor Green
    }
    
}