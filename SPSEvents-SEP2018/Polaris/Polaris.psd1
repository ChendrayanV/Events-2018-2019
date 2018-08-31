#
# Module manifest for module 'Polaris'
#
# Generated by: tylerleonhardt
#
# Generated on: 9/8/17
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule = "$PSScriptRoot\Polaris.psm1"
    
    # Version number of this module.
    ModuleVersion = '0.1.0'
    
    # Supported PSEditions
    CompatiblePSEditions = @('Desktop', 'Core')
    
    # ID used to uniquely identify this module
    GUID = 'd9c86d71-cda6-431e-b297-34e0560f8e30'
    
    # Author of this module
    Author = 'Microsoft Corporation'
    
    # Company or vendor of this module
    CompanyName = 'Microsoft Corporation'
    
    # Copyright statement for this module
    Copyright = '© Microsoft Corporation. All rights reserved'
    
    # Description of the functionality provided by this module
    Description = 'A cross-platform, minimalist web framework for PowerShell'
    
    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'
    
    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''
    
    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''
    
    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()
    
    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    ScriptsToProcess   = @(
        "$PSScriptRoot\Public\New-ScriptblockCallback.ps1",
        "$PSScriptRoot\lib\MimeTypes.Class.ps1",
        "$PSScriptRoot\lib\PolarisRequest.Class.ps1",
        "$PSScriptRoot\lib\PolarisResponse.Class.ps1",
        "$PSScriptRoot\lib\PolarisMiddleware.Class.ps1",
        "$PSScriptRoot\lib\Polaris.Class.ps1"
    )
    
    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()
    
    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()
    
    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()
    
    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport  = @(
        'Get-Polaris'
        'Clear-Polaris'
        'New-PolarisRoute'
        'Remove-PolarisRoute'
        'Get-PolarisRoute'
        'New-PolarisGetRoute'
        'New-PolarisPostRoute'
        'New-PolarisPutRoute'
        'New-PolarisDeleteRoute'
        'New-PolarisStaticRoute'
        'New-PolarisRouteMiddleware'
        'New-ScriptblockCallback'
        'Remove-PolarisRouteMiddleware'
        'Get-PolarisRouteMiddleware'
        'Use-PolarisJsonBodyParserMiddleware'
        'New-DirectoryBrowser'
        'Start-Polaris'
        'Stop-Polaris' )
    
    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport    = @()
    
    # Variables to export from this module
    VariablesToExport  = '*'
    
    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport    = '*'
    
    # List of all modules packaged with this module
    # ModuleList = @()
    
    # List of all files packaged with this module
    # FileList = @()
    
    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData        = @{
    
        PSData = @{
    
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @('web','core','framework','REST')
    
            # A URL to the license for this module.
            LicenseUri = 'https://github.com/PowerShell/Polaris/blob/master/LICENSE.txt'
    
            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/PowerShell/Polaris'
    
            # A URL to an icon representing this module.
            # IconUri = ''
    
            # ReleaseNotes of this module
            ReleaseNotes = @'
# 0.1.0

Initial Release.
'@
    
        } # End of PSData hashtable
    
    } # End of PrivateData hashtable
    
    # HelpInfo URI of this module
    # HelpInfoURI = ''
    
    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
    
}