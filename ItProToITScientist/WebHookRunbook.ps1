write-output "Runbook Started"

write-output "Import SSH Module and starting variables"
$script:POSHSSHModulePath = 'C:\Runbooks\Posh-SSH\Posh-SSH.psd1'
Import-Module $script:POSHSSHModulePath -force

$script:SSHUser = Get-AutomationVariable -Name 'MMSDockerUser'
$StringPass =  Get-AutomationVariable -Name 'MMSDockerPassword'
$script:SSHPassword = ConvertTo-SecureString –String $StringPass –AsPlainText -Force
$script:SSHCredential = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $script:SSHUser, $script:SSHPassword
$script:SSHTargetServer = Get-AutomationVariable -Name 'MMSDockerMachine'

write-output "Starting SSH Session"

New-SSHSession -ComputerName $script:SSHTargetServer -Credential (Get-Credential $script:SSHCredential) -AcceptKey
$Session = Get-SSHSession 

write-output "Stopping Running Image"
Invoke-SSHCommand -Index $Session.SessionID -Command "docker stop mms2016demo"

write-output "Pull Latest Image"
Invoke-SSHCommand -Index $Session.SessionID -Command "sudo docker pull leeberg/itprotoitscientistdemo"

write-output "Deploying Container..."
Invoke-SSHCommand -Index $Session.SessionID -Command "sudo docker run -d -p 80:80 -i -t --name mms2016demo leeberg/itprotoitscientistdemo"
write-output "Container Deployed"

write-output "SSH Commands Complete"

write-output "Closing Session"
Remove-SSHSession -Index $Session.SessionID

write-output "Session CLosed"
write-output "Runbook Complete"