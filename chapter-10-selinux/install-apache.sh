#!/bin/bash

# Install apache package
zypper -n install apache2 

# Enable firewall for services
for service in http https; do
	# Save to be the default
	firewall-cmd --add-service=${service} --permanent

	# Apply to current session
	firewall-cmd --add-service=${service}
done

# Start and enable services on boot
for service in apache2; do
	systemctl start ${service}
	systemctl enable ${service}
done
