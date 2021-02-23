$username = $env:DOCKERUSER
$password = $env:DOCKERPASS | ConvertTo-SecureString -asPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $password)
$BCArtifactUrl = Get-BCArtifactUrl -type Sandbox -storageAccount bcartifacts -select Latest  -country base
$containerName = $env:CONTAINERNAME
$licenseFile = $env:LICENSE_SECUREFILEPATH

$segments = "$PSScriptRoot".Split('\')
$rootFolder = "$($segments[0])\$($segments[1])"
$additionalParameters = @("--volume ""$($rootFolder):C:\agent""")

New-BCContainer `
    -containerName $containerName `
    -accept_eula `
    -alwaysPull `
    -auth NavUserPassword `
    -Credential $credential `
    -artifactUrl $BCArtifactUrl `
    -licenseFile $licenseFile `
    -shortcuts Desktop `
    -memoryLimit 4G `
    -updateHosts `
    -useBestContainerOS `
    -EnableTaskScheduler:$false `
    -doNotCheckHealth `
    -additionalParameters $additionalParameters