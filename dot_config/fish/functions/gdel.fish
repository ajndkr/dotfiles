function gdel --description "Interactive git branch delete"
    set -l branches (git branch --format='%(refname:short)' | grep -v "^main$" | grep -v "^master$" | fzf --multi --height=40% --prompt="Delete branches (TAB to multi-select): ")

    if test -n "$branches"
        for branch in $branches
            echo "Deleting $branch..."
            git branch -d $branch; or git branch -D $branch
        end
    end
end
