function gsw --description "Interactive git branch switch"
    set -l branch (git branch --format='%(refname:short)' | fzf --height=40% --prompt="Switch to branch: ")

    if test -n "$branch"
        git checkout $branch
    end
end
