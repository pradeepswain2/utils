# Map the password with the variable name
# Import the SQLPS module
Import-Module sqlps -DisableNameChecking
$SqlPwd = "Pass12345"
$Pwd = "SqlPwd = '" + $SqlPwd + "'"
# Create login script to create a login named sqlazadmin
# After the login is created, it is added to the sysadmin server role
$TSQLScript = "
CREATE LOGIN sqlazadmin
WITH PASSWORD = `$(SqlPwd) MUST_CHANGE,
DEFAULT_DATABASE=[master],
DEFAULT_LANGUAGE=[us_english],
CHECK_EXPIRATION=ON,
CHECK_POLICY=ON;
 
ALTER SERVER ROLE [sysadmin] ADD MEMBER [sqlazadmin];
"
# Execute the T-SQL script against the SQL Server instance
Invoke-SqlCmd -ServerInstance . -Query $TSQLScript -Database "master" -Variable $Pwd
