function cdel --description "Interactive conda env delete"
    set -l env (conda env list | tail -n +3 | awk '{print $1}' | grep -v "^$" | grep -v "^base$" | fzf --height=40% --prompt="Delete env: ")

    if test -n "$env"
        read -P "Delete '$env'? [y/N] " confirm
        if test "$confirm" = "y"
            conda deactivate 2>/dev/null
            conda env remove -n $env
            echo "✅ Deleted $env"
        end
    end
end
