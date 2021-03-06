@{
    ModuleVersion        = '0.1.0'
    GUID                 = 'c77ccad4-3a8b-4e96-bcf1-4e1e6522d96b'
    Author               = 'Dmitry Ivanov'
    CompanyName          = 'NA'
    DscResourcesToExport = @('*')
    Description          = 'Composite Workstation Main module'

    #RequiredModules     = @(
    #    @{ ModuleName   = 'PSDesiredStateConfiguration' ; ModuleVersion = '1.1'     }
    #    @{ ModuleName   = 'xPSDesiredStateConfiguration'; ModuleVersion = '8.4.0.0' }
    #    @{ ModuleName   = 'NetworkingDsc'               ; ModuleVersion = '6.1.0.0' }
    #    @{ ModuleName   = 'ComputerManagementDsc'       ; ModuleVersion = '5.2.0.0' }
    #)

    PrivateData          = @{

        PSData = @{

            Tags                       = @('DSC', 'Configuration', 'Composite', 'Resource')
            # ExternalModuleDependencies = @('PSDesiredStateConfiguration')

        }
    }
}
