#!/bin/sh
# Shell-agnostic functions
# This file is sourced by all shells (bash, zsh, fish via a wrapper)

# Create a new directory and enter it
mkd() {
    mkdir -p "$@" && cd "$_"
}

# Change working directory to the top-most Finder window location
cdf() {
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
targz() {
    local tmpFile="${@%/}.tar"
    tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1

    size=$(
        stat -f"%z" "${tmpFile}" 2>/dev/null # macOS
    )

    local cmd=""
    if command -v pigz >/dev/null 2>&1; then
        cmd="pigz"
    else
        cmd="gzip"
    fi

    echo "Compressing .tar ($size bytes) using \`${cmd}\`…"
    "${cmd}" -v "${tmpFile}" || return 1
    [ -f "${tmpFile}" ] && rm "${tmpFile}"

    zippedSize=$(
        stat -f"%z" "${tmpFile}.gz" 2>/dev/null # macOS
    )

    echo "${tmpFile}.gz ($zippedSize bytes) created successfully."
}

# Extract most know archives with one command
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)  tar xjf "$1"    ;;
            *.tar.gz)   tar xzf "$1"    ;;
            *.bz2)      bunzip2 "$1"    ;;
            *.rar)      unrar e "$1"    ;;
            *.gz)       gunzip "$1"     ;;
            *.tar)      tar xf "$1"     ;;
            *.tbz2)     tar xjf "$1"    ;;
            *.tgz)      tar xzf "$1"    ;;
            *.zip)      unzip "$1"      ;;
            *.Z)        uncompress "$1" ;;
            *.7z)       7z x "$1"       ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
