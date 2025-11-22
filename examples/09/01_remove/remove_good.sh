#!/bin/bash
# Data validation functions

is_empty() {
    local input="$1"
    [[ -z "$input" ]]
}

allowable_symbols() {
    local input="$1"
    # if no second argument, use default pattern
    local pattern="${2:-'^[a-zA-Z0-9_-]+$'}"
    [[ $input =~ $pattern ]]
}

allowable_length() {
    local input="$1"
    # if no second argument, use default max length
    local max_length="${2:-64}"
    [[ ${#input} -le $max_length ]]
}

validate_input() {
    local input="$1"

    # Check for empty value
    if [[ is_empty "$input" ]]; then
        echo "Error: Input cannot be empty" >&2
        return 1
    fi
    
    # Check for allowed characters (only letters, numbers, dashes, underscores)
    if [[ ! allowed_symbols "$input" ]]; then
        echo "Error: Invalid characters in input" >&2
        return 1
    fi

    # Check for maximum length
    if [[ ! allowable_length "$input" ]]; then
        echo "Error: Input too long" >&2
        return 1
    fi
    
    return 0
}

cleanup_directory() {
    local dir_name="$1"
    
    if validate_input "$dir_name"; then
        local full_path="/tmp/${dir_name}"

        # Additional checks can be added here
        # Check if directory exists
        if [[ -d "$full_path" ]]; then
            rm -rf "${full_path:?}"/*
            echo "Cleaned directory: $full_path"
        else
            echo "Directory does not exist: $full_path" >&2
            return 1
        fi
    else
        echo "Invalid input provided" >&2
        return 1
    fi
}

# Usage
cleanup_directory "$1"