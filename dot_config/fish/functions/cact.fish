function cact --description "Interactive conda activate"
    set -l env (conda env list | tail -n +3 | awk '{print $1}' | grep -v "^$" | fzf --height=40% --prompt="Activate env: ")

    if test -n "$env"
        conda activate $env
    end
end
