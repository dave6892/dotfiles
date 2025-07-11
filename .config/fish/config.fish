if status is-interactive
    # Load common shell configuration
    source ~/.config/fish/functions/source_shell_config.fish
    source ~/.config/fish/functions/load_aliases.fish
    source ~/.config/fish/functions/load_functions.fish
    
    # Initialize rbenv
    status --is-interactive; and source (rbenv init -|psub)
    
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

# Grimoire quick capture aliases
alias qn='grimoire inbox note'
alias ql='grimoire inbox link'
alias qi='grimoire inbox list'
alias qis='grimoire inbox list --summary'
alias qip='grimoire inbox list --unprocessed'
alias qe='grimoire inbox export'

# Project-specific quick capture
function qnp
    set project $argv[1]
    set content $argv[2..-1]
    grimoire inbox note "$content" --project $project
end

function qlp
    set project $argv[1]
    set url $argv[2]
    set desc $argv[3..-1]
    if test -n "$desc"
        grimoire inbox link $url --project $project --desc "$desc"
    else
        grimoire inbox link $url --project $project
    end
end
