$permissions=@()
$groups=Get-ADGroup -Filter * -Properties member
foreach($group in $groups){
    $members=$group|select -ExpandProperty member
    foreach($member in $members){
        $groupmember=Get-ADObject -Identity $member
        $permissions+=[pscustomobject] @{'Gruppenname'=$group.Name; 'Mitglied'=$groupmember.Name; 'Typ'=$groupmember.ObjectClass}
    }
    
}
$permissions | Export-Csv -NoTypeInformation -Path C:\temp\admemberships.csv -Encoding UTF8 -Delimiter ';'
