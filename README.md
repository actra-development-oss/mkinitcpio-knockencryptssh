# mkinitcpio-knockencryptssh
Remotely unlock LUKS over SSH with keyfile support by port-knocking first  
  
  
Because unlocking LUKS on a remote server could be a tedious task I wanted to automate it - that's why I created knockencryptssh.  
It's based on encryptssh but extends it with keyfile support by first port-knocking to switch to a bash shell and afterwards be able to transfer the keyfile by scp.  
Passphrase-based unlocking is still supported - specify the port your SSH server is listening on as knock port for passphrase and you'll be immediately dropped to the cryptsetup_shell.  
  
  
**Workflow**
  
* keyfile-based unlocking  
	0) SSH server listening on port 22, supporting SCP  
	1) knock on e.g. port 23 (or any unused port as configured in /etc/knockencryptssh/knockd.conf), e.g. by calling "telnet &lt;your-host&gt; 23"  
	2) transmit the keyfile by SCP to your SSH server listening on port 22  
	3) done  
  
  
* passphrase-based unlocking  
	0) SSH server listening on port 22  
	1) open a SSH connection, a terminal will ask you to enter the passphrase  
	2) done  
  
  
** Configuration **
  
* Configuration of knockd can be changed in /etc/knockencryptssh/knockd.conf  
    -> In section "options" make sure the interface matches your system
    -> In sections "knockKeyfile" and "knockPassphrase" make sure to specify the knock ports as you like  
    -> All other options can be left untouched if they meet your requirements  
  
* Configuration of knockencryptssh can be changed in /etc/knockencryptssh/knockencryptssh.conf  
    -> There shouldn't be any configuration needed  
  
  
** Examples **
  
You'll find simple examples (they need adjustments to match your environment) in "examples/"
  
  
** Thanks **
  
Big thanks to Giancarlo Razzolini for creating [mkinitcpio-utils](https://github.com/grazzolini/mkinitcpio-utils), which mkinitcpio-knockencryptssh is based on.  
