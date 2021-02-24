Publish-BcContainerApp `
-containerName $(DockerContainer) `
-appFile (Get-ChildItem -Path "$(System.ArtifactsDirectory)\$(Release.PrimaryArtifactSourceAlias)\DemoApp").FullName `
-credential (New-Object System.Management.Automation.PSCredential("$(DockerUser)", ("$(DockerPassword)" | ConvertTo-SecureString -asPlainText -Force))) `
-skipVerification `
-sync `
-install
