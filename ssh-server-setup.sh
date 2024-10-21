#!/usr/bin/bash
# NOTE  I haven't tested this file!

HOST="amd2025"
HOST_NAME="128.100.241.42"
USER="david"
PUBLIC_KEY_FILE="~/.ssh/ided25519.pub"  # This should be your public key file
IDENTITY_FILE="~/.ssh/id_ed25519"  # This should be your private key file
CONFIG_FILE="~/.ssh/config"

# Copy your public SSH Key to the new server (assuming your account exists)
ssh-copy-id -i $PUBLIC_KEY_FILE $USER@$HOST_NAME

# Add this to your '.ssh/config' file:
# Template:
# ```
# Host amd2025
#   HostName 128.100.241.42
#   User david
#   PubkeyAuthentication yes
#   IdentityFile /path/to/.ssh/id_ed25519
#   ForwardAgent yes
# ```
echo "Host $HOST" >> $CONFIG_FILE
echo "  HostName $HOST_NAME" >> $CONFIG_FILE
echo "  User $USER" >> $CONFIG_FILE
echo "  PubkeyAuthentication yes" >> $CONFIG_FILE
echo "  IdentityFile $IDENTITY_FILE" >> $CONFIG_FILE
echo "  ForwardAgent yes" >> $CONFIG_FILE

echo "Verify the config file at '$CONFIG_FILE' is correct:"
cat $CONFIG_FILE
