# Import the SQLPS module
Import-Module sqlps -DisableNameChecking
 
# Stop and start the SQL Server instance
$MachineObject = New-Object ('Microsoft.SqlServer.Management.Smo.Wmi.ManagedComputer') .
# Pickup the default SQL Server instance  
$Mssqlserver = $MachineObject.Services['mssqlserver']
# Stop the service
$Mssqlserver.Stop()
# Wait for 30 seconds
start-sleep -s 30
# Start the service again
$Mssqlserver.Start()
