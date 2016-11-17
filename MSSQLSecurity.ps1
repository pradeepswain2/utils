# Import the SQLPS module
Import-Module sqlps -DisableNameChecking
# Enabled MIXED mode authentication for the SQL Server instance
# Create a SMO object
$LoginObject = New-Object ('Microsoft.SqlServer.Management.Smo.Server') 
# Change the authentication mode to MIXED
$LoginObject.Settings.LoginMode = [Microsoft.SqlServer.Management.SMO.ServerLoginMode]::Mixed
# Persist the changes
$LoginObject.Settings.Alter()
$LoginObject.Settings
"All done"

