#!/usr/bin/bash

### @brief  Start an SSH agent and feed it the SSH password.
### @source https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
