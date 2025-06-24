$mailboxes = Get-Mailbox
$permissions=@()
foreach($mailbox in $mailboxes){
    $permissions+= $mailbox| select UserPrincipalName, DisplayName, PrimarySMTPAddress, GrantSendOnBehalfTo, ForwardingSMTPAddress 
}
$permissions | export-csv -path SendonBehalf_Permissions.csv -Delimiter ';' -NoTypeInformation -Encoding utf8
 
