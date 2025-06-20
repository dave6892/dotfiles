# Function to source shell-agnostic configs and convert them to fish syntax

function source_shell_config
    # Clear any previous environment to avoid duplicates
    set --erase SHELL_SOURCED

    # Source path configuration
    if test -f ~/.shell/path.sh
        # Convert PATH additions to fish syntax
        set --local temp_file (mktemp)
        bash -c "source ~/.shell/path.sh && echo \$PATH" > $temp_file
        set --local new_path (cat $temp_file)
        rm $temp_file
        
        # Split by colon and set PATH
        set --local paths (string split : $new_path)
        set --global --export PATH $paths
    end
    
    # Source exports configuration
    if test -f ~/.shell/exports.sh
        # Extract and set environment variables
        set --local temp_file (mktemp)
        bash -c "source ~/.shell/exports.sh && env" > $temp_file
        
        # Process each environment variable
        for line in (grep -E '^[A-Za-z0-9_]+=' $temp_file)
            set --local key (echo $line | cut -d= -f1)
            set --local value (echo $line | cut -d= -f2-)
            
            # Skip if it's PATH (already handled) or internal bash variables
            if test "$key" != "PATH" -a "$key" != "SHLVL" -a "$key" != "_" -a "$key" != "PWD" -a "$key" != "OLDPWD"
                set --global --export $key $value
            end
        end
        rm $temp_file
    end
    
    # Mark as sourced to avoid double-sourcing
    set --global --export SHELL_SOURCED true
end
