#!/bin/bash

# Set up permissions for nginx:
chmod 755 /home/vagrant
if [ -d "/home/vagrant/oneview-sdk-ruby" ]; then
  chmod 755 /home/vagrant/oneview-sdk-ruby
  if [ ! -d "/home/vagrant/oneview-sdk-ruby/coverage" ]; then
    mkdir /home/vagrant/oneview-sdk-ruby/coverage
  fi
  chmod 755 /home/vagrant/oneview-sdk-ruby/coverage
fi

sudo yum install -y nginx

sudo cat > /etc/nginx/conf.d/default.conf <<'EOL'
# Web server for simplecov output
server {
    listen       80 default_server;
    server_name  _;
    
    # Load configuration files for the default server block.
    include /etc/nginx/default.d/*.conf;
    
    location / {
        root   /home/vagrant/oneview-sdk-ruby/coverage;
        index  index.html index.htm;
    }
    
    error_page  404              /404.html;
    location = /404.html {
        root   /usr/share/nginx/html;
    }
    
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
EOL

sudo service nginx status || sudo nginx
sudo service nginx status && sudo nginx -s reload
