function try
    set -l pkgs
    for pkg in $argv
        set pkgs $pkgs "nixpkgs#$pkg"
    end
    nix shell $pkgs
end
