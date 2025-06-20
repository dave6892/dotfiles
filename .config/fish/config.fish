if status is-interactive
    # Load common shell configuration
    source ~/.config/fish/functions/source_shell_config.fish
    source ~/.config/fish/functions/load_aliases.fish
    source ~/.config/fish/functions/load_functions.fish
    
    # Apply shell-agnostic configurations in fish
    source_shell_config
    load_aliases
    load_functions
end

# Remove greeting message
set -g fish_greeting ""

# Theme settings
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

# OS-specific configurations
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-macos.fish
  case Linux
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

# Load local configuration if it exists
set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
