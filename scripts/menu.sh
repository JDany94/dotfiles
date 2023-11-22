#!/bin/bash

# Function to search aliases from a specified section in the aliases file
get_aliases() {
  section=$1
  in_section=false
  aliases=""

  while IFS= read -r line; do
    # Check if the line marks the beginning of the specified section
    if [[ $line == "# $section" ]]; then
      in_section=true
    elif [[ $line == "# "* ]]; then
      in_section=false
    fi

    # If it is the specified section and the line is an alias, extracts the alias name and comment
    if [[ $in_section == true && $line == "alias "* ]]; then
      alias_name="${line#alias}"
      comment=$(echo "$line" | sed 's/.*#\s*//')
      aliases+="${alias_name%%=*} > $comment\n"
    fi
  done <~/.dotfiles/shell/aliases.sh

  # Removes the final newline character and returns the result
  result=$(echo -e "$aliases" | sed '$s/\\n$//')
  echo "$result"
}

# Select a section using fzf, excluding the '# Menu' section
section_name=$(grep -v '^# Menu' ~/.dotfiles/shell/aliases.sh | grep '^#' | sed 's/#/>/' | fzf | sed 's/>//' | tr -d '[:space:]')

if [[ -n $section_name ]]; then
  # Search aliases for the selected section
  section_aliases=$(get_aliases "$section_name")

  # Select an alias using fzf, extract the alias name, and remove spaces
  selected_alias=$(echo -e "$section_aliases" | fzf -d $'\n' | awk -F'>' '{print $1}' | tr -d '[:space:]')

  if [[ -n $selected_alias ]]; then
    # Search the command associated with the selected alias and execute it
    echo $selected_alias
    command_to_run=$(grep "^alias $selected_alias=" ~/.dotfiles/shell/aliases.sh | awk -F'"' '{print $2}')
    if [[ $section_name == "Git" ]]; then
      # Check if the selected section is "GIT"
      echo "The 'Git' commands need additional arguments. Run them outside the menu"
    elif [[ -n $command_to_run ]]; then
      if [[ $selected_alias != ".." ]]; then
        # If there is a command associated with the selected alias and it's not "..", execute it
        eval "$command_to_run"
      else
        echo "The command '$selected_alias' cannot be executed from this script."
      fi
    else
      echo "You haven't selected any alias"
    fi
  else
    echo "You haven't selected any alias"
  fi
else
  echo "You haven't selected any option"
fi
