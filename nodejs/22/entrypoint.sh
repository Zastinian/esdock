#!/bin/bash
cd /home/container

# Retrieves the internal IP address and exports it for further use.
export INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')

# Displays the currently installed Node.js version.
node -v

# Replaces placeholders in the startup command with actual values.
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Executes the modified startup command.
eval ${MODIFIED_STARTUP}
