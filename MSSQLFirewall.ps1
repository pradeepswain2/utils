# Configure the TCP port rule in Windows Firewall to allow connections
# Prepare the arguments for the NETSH command
$TCPPort = "1433"
$Arguments = "advfirewall firewall add rule name = SQLPort dir = in protocol = tcp action = allow localport = " + $TCPPort + " remoteip = ANY profile = PUBLIC"
# Execute the command silently
$p = Start-Process netsh -ArgumentList $Arguments -wait -NoNewWindow -PassThru
$p.HasExited
$p.ExitCode
