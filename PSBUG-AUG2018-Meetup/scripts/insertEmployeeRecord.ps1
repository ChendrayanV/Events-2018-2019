param(
    $employeeNumber,

    $firstname,

    $lastname,

    $displayname,

    $email,

    $country,

    $mobile
)

try {
    Import-Module 'C:\Projects\contoso\assemblies\MySql.Data.dll'
    $ConnectionString = "Server=localhost;Uid=root;Pwd=India890*;database=company;SslMode=none;"
    $Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    $Connection.ConnectionString = $ConnectionString
    $Connection.Open()
    $Command = New-Object MySql.Data.MySqlClient.MySqlCommand -ArgumentList (
        "INSERT INTO EMPLOYEE (employee_number,firstname,lastname,displayname,email,country,mobile) VALUES(
            '$employee_number' , '$firstname' , '$lastname' , '$displayname' , '$email' , '$country' , '$mobile'
            )", $Connection
    )
    $Command.ExecuteNonQuery()
}
catch {
    $_.Exception 
}