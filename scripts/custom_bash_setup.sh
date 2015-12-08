sudo cat > /etc/profile.d/custom_bash_setup.sh <<'EOL'
# Set some helful aliases
alias ls='ls --color'
alias ll='ls -lah --color'
alias path='echo $PATH | tr ":" "\n"'

# Set oneview-sdk-ruby environment variables
export ONEVIEWSDK_SSL_ENABLED=false
# export ONEVIEWSDK_URL="https://oneview.domain.com"
export ONEVIEWSDK_USER="Administrator"
# export ONEVIEWSDK_PASSWORD="password123"

# export ONEVIEWSDK_INTEGRATION_CONFIG='/home/vagrant/_one_view_config.json'
# export ONEVIEWSDK_INTEGRATION_SECRETS='/home/vagrant/_one_view_secrets.json'
EOL
