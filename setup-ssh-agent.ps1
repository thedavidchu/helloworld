################################################################################
########################################################################
### @note   Make sure you're running as an Administrator
### @note   I assume you already have a file called '~\.ssh\id_ed25519'
### @note   UNTESTED!!! I don't know how to write PowerShell scripts...
### @note   I tried setting up the ssh-agent with Git Bash on my Windows
###         machine, but it wouldn't work after I closed the terminal
###         for some strange reason. This seemed to work, which is why I
###         am creating this beautiful (but untested) script!
### Sources:
###     1. https://code.visualstudio.com/docs/remote/troubleshooting#_setting-up-the-ssh-agent
###     2. https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement
################################################################################

# Test that the private key exists.
$PRIVATE_KEY_PATH = ~\.ssh\id_ed25519
if (!(Test-Path $PRIVATE_KEY_PATH)) {
    throw "The file $PRIVATE_KEY_PATH does not exist"
}

# Setup agent.
Set-Service ssh-agent -StartupType Automatic
Start-Service ssh-agent
Get-Service ssh-agent

# Add the private key passkey to the agent.
# (NOTE: you will be prompted for your passkey)
ssh-add $PRIVATE_KEY_PATH

# [OPTIONAL - DISABLED] Print out the public key.
if ($false) {
    ssh-add -L
}
