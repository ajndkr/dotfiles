function cdelall --description "Delete ALL conda envs and purge cache"
    read -P "⚠️  Delete ALL conda environments? [y/N] " confirm
    if test "$confirm" != "y"
        return 0
    end

    conda deactivate 2>/dev/null

    for env in (conda env list | tail -n +3 | awk '{print $1}' | grep -v "^$" | grep -v "^base$")
        echo "Removing $env..."
        conda env remove -n $env -y
    end

    echo "Purging cache..."
    conda clean --all -y
    echo "✅ All environments deleted and cache purged"
end
