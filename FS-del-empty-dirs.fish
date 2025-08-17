function FS-del-empty-dirs
    if test (count $argv) -eq 0
        echo "❌ Usage: FS-del-empty-dirs <target-directory>"
        return 1
    end

    set target_dir $argv[1]

    if not test -d $target_dir
        echo "❌ Error: '$target_dir' is not a directory."
        return 1
    end

    set empty_dirs (find $target_dir -type d -empty)

    if test (count $empty_dirs) -eq 0
        echo "ℹ️  No empty directories found in: $target_dir"
        return 0
    end

    echo "⚠️  The following empty directories will be deleted from: $target_dir"
    for d in $empty_dirs
        echo "  $d"
    end

    echo
    echo -n "❓ Are you sure you want to delete them? (y/N): "
    read confirm

    if test "$confirm" = "y"
        find $target_dir -type d -empty -delete
        echo "✅ Deleted empty directories."
    else
        echo "❌ Aborted."
    end
end

