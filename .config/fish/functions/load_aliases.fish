# Function to load aliases from shell-agnostic configuration

function load_aliases
    if test -f ~/.shell/aliases.sh
        # Parse and set aliases from the shared file
        for line in (grep -E '^alias [a-zA-Z0-9_]+=' ~/.shell/aliases.sh)
            set --local parts (string match -r 'alias ([a-zA-Z0-9_]+)="?([^"]+)"?' $line)
            
            if test (count $parts) -eq 3
                set --local alias_name $parts[2]
                set --local alias_value $parts[3]
                
                # Remove trailing quote if present
                set alias_value (string replace -r '"$' '' $alias_value)
                
                # Define the alias in fish
                alias $alias_name $alias_value
            end
        end
    end
end
