function generateSecret
    openssl rand -base64 32 | pbcopy

    echo "Copied secret to clipboard!"
end
