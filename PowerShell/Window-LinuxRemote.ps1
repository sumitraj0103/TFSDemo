#################################
#
# Script to connect Remotely the Linux server 
# Run command and get the Output
#
#############################

#Get the SSH module

find-module Posh-ssh
Install-Module Posh-SSH

#Above step is one time Installation . We can comment once it runs successful
$linuxserver=#Server Name
$username =#User name to connect Linux box
$password =#Password for the Linux 

#Set Creds
$cred = new-object -typename System.Management.Automation.PSCredential($username, $password)
try{

New-SSHSession -ComputerName $linuxserver -Credential (Get-Credential)
Invoke-SSHCommand -Index 0 -Command "uname"

}
catch{

 write-host "Exception During the run" $_.exception

}