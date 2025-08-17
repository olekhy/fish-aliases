function FS-del-files-by-ext
    if test (count $argv) -ne 2
        echo "❌ Usage: FS-del-files-by-ext <directory> <extension>"
        return 1
    end

    set dir $argv[1]
    set ext $argv[2]

    if not test -d "$dir"
        echo "❌ Directory '$dir' does not exist."
        return 1
    end

    set files (find "$dir" -type f -name "*.$ext")

    if test (count $files) -eq 0
        echo "ℹ️  No '*.$ext' files found in: $dir"
        return 0
    end

    echo "⚠️  Will delete the following (count: "(count $files)") *.$ext files in:"
    echo "$dir"
    echo

    for f in $files
        echo "  $f"
    end

    echo
    echo -n "❓ Are you sure you want to delete them? (y/N): "
    read confirm

    if test "$confirm" = "y"
        for f in $files
            rm "$f"
        end
        echo "✅ Deleted (count: "(count $files)") *.$ext files."
    else
        echo "❌ Aborted."
    end
end

