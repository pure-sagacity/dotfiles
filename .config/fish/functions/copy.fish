function copy
    if test (count $argv) -eq 0
        echo "Usage: copy <file>"
        return 1
    end
    
    if not test -f $argv[1]
        echo "Error: File '$argv[1]' not found"
        return 1
    end
    
    /bin/cat $argv[1] | pbcopy
    
    if test $status -eq 0
        echo "Copied contents of '$argv[1]' to clipboard"
    else
        echo "Error: Failed to copy to clipboard"
        return 1
    end
end
