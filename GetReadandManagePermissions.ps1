$mailboxes = Get-Mailbox|selec
$permissions=@()
 
#Read and Manage Permissions
foreach($mailbox in $mailboxes){
    $permissions+=Get-MailboxPermission -Identity $mailbox.PrimarySmtpAddress| where { -not ($_.User -match "NT AUTHORITY") -and ($_.IsInherited -eq $false)}
}
$permissions | export-csv -path Read_Manage_Permissions.csv -Delimiter ';' -NoTypeInformation -Encoding utf8
