# Configure the SQL Server TCP/IP protocol for the port that was configured in the endpoint
# Import the SQLPS module
Import-Module sqlps -DisableNameChecking
# Create a SMO object
$TCPPort = "1433"
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SqlWmiManagement") | out-null
$MachineObject = New-Object ('Microsoft.SqlServer.Management.Smo.WMI.ManagedComputer') .
$tcp = $MachineObject.GetSMOObject("ManagedComputer[@Name='" + (Get-Item env:\computername).Value + "']/ServerInstance[@Name='MSSQLSERVER']/ServerProtocol[@Name='Tcp']")
if ($tcp.IsEnabled -ne "True")
{
    $tcp.IsEnabled = $true
    $tcp.alter
    $MachineObject.GetSMOObject($tcp.urn.Value + "/IPAddress[@Name='IPAll']").IPAddressProperties[1].Value = $TCPPort
    $tcp.alter()
}
else
{
    $MachineObject.GetSMOObject($tcp.urn.Value + "/IPAddress[@Name='IPAll']").IPAddressProperties[1].Value = $TCPPort
    $tcp.alter()
}