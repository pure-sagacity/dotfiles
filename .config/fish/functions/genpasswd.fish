function genpasswd
    read --silent --prompt-str "Password: " password
    echo

    echo -n "$password" | nix run nixpkgs#libargon2 -- "(head -c 20 /dev/random | base64)" -e | pbcopy

    echo "Secret copied..."
end
