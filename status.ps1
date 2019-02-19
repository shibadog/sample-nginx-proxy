$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$services = $(Get-ChildItem $scriptPath/etc/docker-compose.d/service.*).Name | ForEach-Object { $_.replace("service.", "") }

$status = docker-compose -f $scriptPath/etc/docker-compose.d/proxy/docker-compose.yml ps
$services | ForEach-Object {
    $tmp = docker-compose -f $scriptPath/etc/docker-compose.d/service.${_}/docker-compose.yml ps
    $tmp | Select-Object -Skip 2 | ForEach-Object {
        $status += $_
    }
}
Write-Output $status
