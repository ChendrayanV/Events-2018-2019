param(
    $employeeNumber
)
try {
    Import-Module 'C:\Projects\contoso\assemblies\MySql.Data.dll'
    $ConnectionString = "Server=localhost;Uid=root;Pwd=India890*;database=company;SslMode=none;"
    $Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    $Connection.ConnectionString = $ConnectionString
    $Connection.Open()
    $Command = New-Object MySql.Data.MySqlClient.MySqlCommand -ArgumentList (
        "select * from employee where employee_number='$employeeNumber'", $Connection
    )
    $DataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter -ArgumentList ($Command)
    $DataSet = New-Object System.Data.DataSet
    [void]$DataAdapter.Fill($DataSet , "data")
    $DataSet.Tables['data'] |
        Select-Object employee_number , firstname , lastname , displayname , email | 
        ConvertTo-Json
}
catch {
    $_.Exception 
}