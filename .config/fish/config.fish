if status is-interactive
    # Commands to run in interactive sessions can go here
    export PATH="$HOME/bin:$PATH";
    for file in ~/.{path,exports,aliases,functions,extra}
        [ -r "$file" ] && [ -f "$file" ] && bass source $file
    end

end


if status --is-login
end
