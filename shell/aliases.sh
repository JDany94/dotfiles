# Jumps
alias dotfiles="cd ~/.dotfiles" # Goes to the .dotfiles directory
alias sd="cd ~/Documentos/repos/smart-stack-definitions/" # Goes to the stack definitions directory
alias repos="cd ~/Documentos/repos/" # Goes to the repositories directory

# Git
alias gb="git checkout -b" # git checkout -b
alias gd="~/.dotfiles/scripts/git/pretty_diff" # pretty git diff
alias gc="git checkout" # git checkout
alias gs="git status" # git status
alias gpl="git pull" # git pull
alias gps="git push" # git push

# Docker
alias dconnect="~/.dotfiles/scripts/docker/docker_connect" # Enters the terminal of the selected container
alias dlogs="~/.dotfiles/scripts/docker/docker_logs" # Show the logs of the selected service
alias dwatch="~/.dotfiles/scripts/docker/docker_watch" # watch docker service ls
alias localdp="~/.dotfiles/scripts/docker/local_deploy" # Deploy the local environment for Smart
alias localrm="~/.dotfiles/scripts/docker/local_rm" # Remove all services from the local environment for Smart
alias rmservice="~/.dotfiles/scripts/docker/service_rm" # Remove the selected service

# Others
alias o.="open ." # Opens a file explorer in the current location
alias cl="clear" # Clear the screen
alias ..="cd .." # Go back one directory
alias ll="ls -l" # List files in long format
alias la="ls -a" # List all files
alias x="exit" # Exit

# Menu
alias menu="source ~/.dotfiles/scripts/menu.sh" # IMPORTANT: new sections must be above the Menu section
