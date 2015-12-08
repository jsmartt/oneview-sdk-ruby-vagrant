FILE='/etc/profile.d/z_custom_bash_setup.sh'
if [ ! -f $FILE ]; then
sudo cat > $FILE <<'EOL'
# Set some helful aliases
alias ls='ls --color'
alias ll='ls -lah --color'
alias path='echo $PATH | tr ":" "\n"'

echo "Setting oneview-sdk-ruby environment variables in '/etc/profile.d/z_custom_bash_setup.sh'."
# Set oneview-sdk-ruby environment variables
export ONEVIEWSDK_SSL_ENABLED=false
# export ONEVIEWSDK_URL="https://oneview.domain.com"
export ONEVIEWSDK_USER="Administrator"
# export ONEVIEWSDK_PASSWORD="password123"

# export ONEVIEWSDK_INTEGRATION_CONFIG='/home/vagrant/_one_view_config.json'
# export ONEVIEWSDK_INTEGRATION_SECRETS='/home/vagrant/_one_view_secrets.json'

if command -v oneview-sdk-ruby > /dev/null 2>&1 ; then
  oneview-sdk-ruby env
fi
EOL
fi
