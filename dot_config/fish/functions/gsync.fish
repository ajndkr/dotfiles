function gsync --description "Sync current branch: stash → pull --rebase → unstash"
    set -l stash_result (git stash push -m "gsync auto-stash" 2>&1)
    set -l did_stash 0

    if not string match -q "No local changes*" $stash_result
        set did_stash 1
        echo "📦 Stashed changes"
    end

    echo "⬇️  Pulling with rebase..."
    git pull --rebase
    set -l pull_status $status

    if test $did_stash -eq 1
        echo "📦 Restoring stashed changes..."
        git stash pop
    end

    if test $pull_status -eq 0
        echo "✅ Sync complete"
    else
        echo "❌ Pull failed"
        return 1
    end
end
