Get-NetTCPConnection -State Listen |
  Select-Object LocalAddress, LocalPort, OwningProcess |
  Sort-Object LocalPort |
  ForEach-Object {
    $proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
    [PSCustomObject]@{
      IP       = $_.LocalAddress
      Puerto   = $_.LocalPort
      Proceso  = if ($proc) { $proc.ProcessName } else { "Desconocido" }
    }
  }
