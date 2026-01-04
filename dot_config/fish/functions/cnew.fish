function cnew --description "Create new conda env with Python version selection"
    set -l env_name $argv[1]

    if test -z "$env_name"
        read -P "Environment name: " env_name
    end

    set -l py_versions "3.12" "3.11" "3.10"
    set -l py_ver (printf '%s\n' $py_versions | fzf --height=30% --prompt="Python version: ")

    if test -n "$py_ver"
        echo "Creating conda env '$env_name' with Python $py_ver..."
        conda create -n $env_name python=$py_ver -y
        conda activate $env_name
    end
end
