param (
    $guid,

    $name,

    $email,

    $groupName,

    $actionType,

    $groupMembers,

    $reason,

    $snowUser,

    $snowPass,

    $IdAMUser,

    $IdAMPass,

    $APIKey,

    $ApiSecret
)

try {
    if (-not ([System.Management.Automation.PSTypeName]'TrustAllCertsPolicy').Type) {
        Add-Type -TypeDefinition @"
        using System.Net;
        using System.Security.Cryptography.X509Certificates;
        public class TrustAllCertsPolicy : ICertificatePolicy {
            public bool CheckValidationResult(
                ServicePoint srvPoint, X509Certificate certificate,
                WebRequest request, int certificateProblem) {
                return true;
            }
        }
"@ 
    }
    [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy -ErrorAction SilentlyContinue
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $Uri = "https://api-central.pwcinternal.com:7443/pwcnetwork/service_now/api/pglsc/ad_group_management/create"
    $Body = [pscustomobject]@{
        guid         = $guid
        name         = $name
        email        = $email
        groupName    = $groupName
        actionType   = $actionType
        groupMembers = $groupMembers
        reason       = $reason
    } | ConvertTo-Json
    $Authorization = [Convert]::ToBase64String(
        [Text.Encoding]::ASCII.GetBytes(
            (
                "{0}:{1}" -f $snowUser, $snowPass
            )
        )
    )
    $ProxyAuthorization = [Convert]::ToBase64String(
        [Text.Encoding]::ASCII.GetBytes(
            (
                "{0}:{1}" -f $IdAMUser , $IdAMPass
            )
        )
    )
    $Headers = @{
        apikey                = $APIKey
        apikeySecret          = $ApiSecret
        "proxy-authorization" = "basic " + $ProxyAuthorization
        authorization         = "basic " + $Authorization
        "Content-Type"        = "application/json"
    }
    $Result = Invoke-RestMethod -Method Post -Uri $Uri -Body $Body -Headers $Headers -TimeoutSec 45
    $Result.result | ConvertTo-Json
}
catch {
    $_.Exception | Select-Object *
}