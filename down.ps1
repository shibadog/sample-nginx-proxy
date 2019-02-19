$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$services = $(Get-ChildItem $scriptPath/etc/docker-compose.d/service.*).Name | ForEach-Object { $_.replace("service.", "") }

docker-compose -f $scriptPath/etc/docker-compose.d/proxy/docker-compose.yml down
$services | ForEach-Object {
    docker-compose -f $scriptPath/etc/docker-compose.d/service.${_}/docker-compose.yml down
}
