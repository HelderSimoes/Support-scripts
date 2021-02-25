$osbde = Get-BitLockerVolume | where { ($_.volumetype -eq 'OperatingSystem') -and ($_.protectionstatus -eq 'On')}
$bdeosprot = $osbde.KeyProtector
foreach ( $prot in $bdeosprot) {
    if ( $prot.KeyProtectorType -eq 'RecoveryPassword') {
        $bdeosrkID = $prot.keyprotectorId
        BackupToAAD-BitLockerKeyProtector -MountPoint $osbde.MountPoint -KeyProtectorId $bdeosrkID
           }
    }