$mailboxes = Get-Mailbox
$permissions=@()
foreach($mailbox in $mailboxes){
    $permissions+=Get-RecipientPermission -Identity $mailbox.Identity | where { -not ($_.Trustee -match "NT AUTHORITY") -and ($_.IsInherited -eq $false)}
}
$permissions | export-csv -path Sendas_Permissions.csv -Delimiter ';' -NoTypeInformation -Encoding utf8
