# Function to load functions from shell-agnostic configuration

function load_functions
    # Define fish versions of the shell functions
    
    # Create a new directory and enter it
    function mkd
        mkdir -p $argv && cd $argv[-1]
    end
    
    # Change working directory to the top-most Finder window location
    function cdf
        cd (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
    end
    
    # Create a .tar.gz archive
    function targz
        set tmpFile (string replace -r '/$' '' -- $argv).tar
        tar -cvf $tmpFile --exclude=".DS_Store" $argv || return 1
        
        set size (stat -f "%z" $tmpFile 2>/dev/null)
        
        set cmd "gzip"
        if command -v pigz >/dev/null 2>&1
            set cmd "pigz"
        end
        
        echo "Compressing .tar ($size bytes) using `$cmd`…"
        eval $cmd -v $tmpFile || return 1
        
        if test -f $tmpFile
            rm $tmpFile
        end
        
        set zippedSize (stat -f "%z" "$tmpFile.gz" 2>/dev/null)
        echo "$tmpFile.gz ($zippedSize bytes) created successfully."
    end
    
    # Extract most known archives
    function extract
        if test -f $argv[1]
            switch $argv[1]
                case '*.tar.bz2'
                    tar xjf $argv[1]
                case '*.tar.gz'
                    tar xzf $argv[1]
                case '*.bz2'
                    bunzip2 $argv[1]
                case '*.rar'
                    unrar e $argv[1]
                case '*.gz'
                    gunzip $argv[1]
                case '*.tar'
                    tar xf $argv[1]
                case '*.tbz2'
                    tar xjf $argv[1]
                case '*.tgz'
                    tar xzf $argv[1]
                case '*.zip'
                    unzip $argv[1]
                case '*.Z'
                    uncompress $argv[1]
                case '*.7z'
                    7z x $argv[1]
                case '*'
                    echo "'$argv[1]' cannot be extracted via extract()"
            end
        else
            echo "'$argv[1]' is not a valid file"
        end
    end
end
