$mailboxes = Get-Mailbox
$mailboxes|select Identity, PrimarySmtpAddress, DisplayName|export-csv -path Identities.csv -Delimiter ';' -NoTypeInformation -Encoding utf8
