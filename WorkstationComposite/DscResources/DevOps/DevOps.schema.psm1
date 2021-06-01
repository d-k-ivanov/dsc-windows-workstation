﻿<#
.SYNOPSIS
Install DevOps and Admin tools.

.DESCRIPTION
Install DevOps and Admin tools.

.PARAMETER Credential
User credental.

.PARAMETER NoUpgrade
Do not upgrade installed packages to their latest versions.
#>

Configuration DevOps
{
    Param
    (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [pscredential] $Credential,

        [switch] $AutoUpdate
    )

    Import-DscResource –ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName cChoco

    cChocoinstaller InstallChocolatey
    {
        InstallDir              = 'C:\ProgramData\chocolatey'
    }

    ## Template
    # cChocoPackageInstaller InstallPackageName
    # {
    #     Name                    = 'PackageName'
    #     Version                 = ''
    #     Params                  = ''
    #     AutoUpgrade             = $AutoUpdate
    #     Ensure                  = 'Present | Absent'
    #     DependsOn               = '[cChocoInstaller]InstallChocolatey'
    # }

    cChocoPackageInstaller InstallOnePassword
    {
        Name                    = '1password'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallAWSCli
    {
        Name                    = 'awscli'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallAzureCli
    {
        Name                    = 'azure-cli'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallBindTools
    {
        Name                    = 'bind-toolsonly'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    Script DownloadBindToolsConfig
    {
        SetScript               = {
            Write-Output 'nameserver 8.8.8.8' > $env:SystemRoot\System32\Drivers\etc\resolv.conf
            Write-Output 'nameserver 77.88.8.8' >> $env:SystemRoot\System32\Drivers\etc\resolv.conf
        }
        GetScript               = { @{} }
        TestScript              = {
            Test-Path $env:SystemRoot\System32\Drivers\etc\resolv.conf
        }
    }

    cChocoPackageInstaller InstallBitwarden
    {
        Name                    = 'bitwarden'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallBitwardenCli
    {
        Name                    = 'bitwarden-cli'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallCharles4
    {
        Name                    = 'charles4'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallChefDK
    {
        Name                    = 'chefdk'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallConEmu
    {
        Name                    = 'conemu'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallCurl
    {
        Name                    = 'curl'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallFtpdmin
    {
        Name                    = 'ftpdmin'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallGPG4Win
    {
        Name                    = 'gpg4win'
        AutoUpgrade             = $false
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKeepass
    {
        Name                    = 'keepass'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKeepassFavicon
    {
        Name                    = 'keepass-yet-another-favicon-downloader'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKeepassQRCode
    {
        Name                    = 'keepass-plugin-qrcodegen'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKeystoreExplorer
    {
        Name                    = 'keystore-explorer.portable'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKubernetesCli
    {
        Name                    = 'kubernetes-cli'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKubernetesHelm
    {
        Name                    = 'kubernetes-helm'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKubernetesK9S
    {
        Name                    = 'k9s'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKubernetesKompose
    {
        Name                    = 'kubernetes-kompose'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKubernetesKops
    {
        Name                    = 'kubernetes-kops'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallKubernetesLens
    {
        Name                    = 'lens'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallLdapAdmin
    {
        Name                    = 'ldapadmin'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallMinikube
    {
        Name                    = 'minikube'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallMremoteng
    {
        Name                    = 'mremoteng'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallMysqlWorkbench
    {
        Name                    = 'mysql.workbench'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallNmap
    {
        Name                    = 'nmap'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallNssm
    {
        Name                    = 'nssm'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallOpenConnect
    {
        Name                    = 'openconnect-gui'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallOpenSSH
    {
        Name                    = 'openssh'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallOpenSslLight
    {
        Name                    = 'openssl.light'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallOpenVPN
    {
        Name                    = 'openvpn'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallTAPWindows
    {
        Name                    = 'tapwindows'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallPacker
    {
        Name                    = 'packer'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallPgAdmin4
    {
        Name                    = 'pgadmin4'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller Pulumi
    {
        Name                    = 'pulumi'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallPuTTY
    {
        Name                    = 'putty'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    Script DownloadRDCMan
    {
        SetScript               = { Invoke-WebRequest -Uri 'https://github.com/d-k-ivanov/dsc-windows-workstation/blob/master/Installers/rdcman.msi?raw=true' -OutFile 'C:\Windows\Temp\rdcman.msi' }
        GetScript               = { @{} }
        TestScript              = { Test-Path 'C:\Windows\Temp\rdcman.msi' }
    }

    Script InstallRDCMan
    {
        SetScript               = { Start-Process -FilePath "msiexec.exe" -ArgumentList "/i C:\Windows\Temp\rdcman.msi /qn" -Wait }
        GetScript               = { @{} }
        TestScript              = { Test-Path "${Env:ProgramFiles(x86)}\Remote Desktop Connection Manager" }
        DependsOn               = '[Script]DownloadRDCMan'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallRobo3t
    {
        Name                    = 'robo3t'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallRufus
    {
        Name                    = 'rufus'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallSuperPuTTY
    {
        Name                    = 'superputty'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallSQLiteBrowser
    {
        Name                    = 'sqlitebrowser.install'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallSQServerManagementStudio
    {
        Name                    = 'sql-server-management-studio'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallTerraform
    {
        Name                    = 'terraform'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallTFTPD32
    {
        Name                    = 'tftpd32'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallTightVNC
    {
        Name                    = 'tightvnc'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallVagrant
    {
        Name                    = 'vagrant'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallVagrantManager
    {
        Name                    = 'vagrant-manager'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Absent'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallVcXsrv
    {
        Name                    = 'vcxsrv'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallWget
    {
        Name                    = 'wget'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallWifiInfoView
    {
        Name                    = 'wifiinfoview'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallWinSCP
    {
        Name                    = 'winscp.install'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallWinpcap
    {
        Name                    = 'winpcap'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallWireshark
    {
        Name                    = 'wireshark'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }

    cChocoPackageInstaller InstallWMIExplorer
    {
        Name                    = 'wmiexplorer'
        AutoUpgrade             = $AutoUpdate
        Ensure                  = 'Present'
        DependsOn               = '[cChocoInstaller]InstallChocolatey'
        PsDscRunAsCredential    = $Credential
    }
}
