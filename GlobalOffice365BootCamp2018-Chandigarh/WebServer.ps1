# IMPORT REQUIRED MODULES (POLARIS and PSHTML - REST IS CSOM)
Import-Module Polaris -Verbose
Import-Module PSHTML -Verbose
Add-Type -AssemblyName System.Web -Verbose 
New-PolarisStaticRoute -RoutePath "/assets"  -FolderPath "./assets"
# YOUR ROUTES - MADE SIMPLE
foreach($route in (Get-ChildItem .\routes)) {
    . $route.FullName
}

(Start-Polaris -Port 8080)