sudo cat > /etc/profile.d/z_git_prompt.sh <<'EOL'
# Set bash prompt
export PS1='\[\033[32m\]\u@\h \[\033[33m\]$PWD\[\033[0m\]\n$ '

# Download and Source the git-prompt script to load __git_ps1 (shows git branch if in a git repo)
if [ ! -f ~/.git-prompt.sh ]; then
  echo "Downloading git-prompt.sh ..."
  URL=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  curl -o ~/.git-prompt.sh -m 3 $URL || echo "Failed to download from $URL"
fi
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export PS1='\[\033[32m\]\u@\h \[\033[33m\]$PWD$(__git_ps1)\[\033[0m\]\n$ '
fi
EOL
