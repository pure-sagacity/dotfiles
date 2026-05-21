function clone-starter
    if test (count $argv) -eq 0
        echo "Usage: clone-starter <project-name>"
        return 1
    end

    set project_name $argv[1]

    git clone https://github.com/pure-sagacity/turborepo-starter-project.git $project_name

    if test $status -ne 0
        echo "Error: git clone failed"
        return 1
    end

    rm -rf $project_name/.git

    echo "✓ Created $project_name (git history removed)"
end
