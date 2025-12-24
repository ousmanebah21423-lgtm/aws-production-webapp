#!/bin/bash

# Update system
yum update -y

# Install nginx
yum install -y nginx

# Enable and start nginx
systemctl enable nginx
systemctl start nginx

# Create app directory
mkdir -p /usr/share/nginx/html

# Deploy web page
cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>AWS Production Web App</title>
</head>
<body>
    <h1>Production Web App on AWS</h1>
    <p>Automatically deployed using EC2 User Data.</p>
</body>
</html>
EOF
