 for ($i = 1; $i -le 2; $i++) {
        [System.IO.File]::WriteAllLines('C:\malware-samples\eicar.com_'+$i, 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*', [System.Text.UTF8Encoding]($False))
        Start-Sleep -Seconds 5
      }