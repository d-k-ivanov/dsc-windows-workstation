Configuration SetComputerName
{
    Param(
        
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $Name,

	[ValidateNotNullorEmpty()]
        [string] $Workgroup = 'Workgroup'

    )
    
    Import-DscResource -Module ComputerManagementDsc -Name Computer
    
    Computer SetName
    {
        Name             = $Name
        WorkGroupName    = $Workgroup
#        Name             = 'divanov-dev'
#        WorkGroupName    = 'Workgroup'
    }
}
