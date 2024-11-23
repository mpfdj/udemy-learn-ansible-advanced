# -------------------------------------------------------------------------------------------
# This scripts builds an Alpine image, runs a container and creates an Ansible inventory file
# -------------------------------------------------------------------------------------------


# Build Docker image
if (!(docker images -q miel1980/alpine-ssh-enabled:latest)) {
    $AlpineDockerFile = "C:\Users\TO11RC\OneDrive - ING\miel\workspace\Ansible_P03881_P17064-BW5_15\udemy-learn-ansible-advanced\docker\managed_nodes\alpine.dockerfile"
    docker image build -f $AlpineDockerFile -t miel1980/alpine-ssh-enabled .
}


# Create empty inventory.ini file
New-Item -Path . -Name "inventory.ini" -Force -Value "[alpine_servers]`n" | Out-Null


For($i=1; $i -le 3; $i++) {
    $ContainerName = "alpine" + $i

    # Run Docker container
    $AlpineContainer = docker ps -a --format '{{.Names}}' | Select-String $ContainerName
    if (!$AlpineContainer) {
        docker container run -d --rm --privileged --name $ContainerName miel1980/alpine-ssh-enabled
    }


    $IPAddress = docker inspect --format '{{ .NetworkSettings.IPAddress }}' $ContainerName

#    # Parsing Json object. Better to get it directly
#    $Json = docker inspect $ContainerName | ConvertFrom-Json
#    $IPAddress = $Json.NetworkSettings.IPAddress

    $InventoryLine = "$ContainerName ansible_host=$IPAddress ansible_connection=ssh ansible_user=root ansible_ssh_pass=Passw0rd"
    Add-Content -Path .\inventory.ini -Value $InventoryLine
}

Write-Host ""
Get-Content .\inventory.ini
Write-Host "`n"
