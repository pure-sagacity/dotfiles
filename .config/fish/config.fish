if status is-interactive
    # Starship and Zoxide
    starship init fish | source
    zoxide init fish | source

    # Activate Dotenv On CD
    eval "$(devenv hook fish)"

    # Aliases
    alias cat=/run/current-system/sw/bin/bat
    alias ocat=/bin/cat
    alias docker=podman
    alias ls='/run/current-system/sw/bin/eza --icons'
    alias ols=/bin/ls
    alias kubectx='kubectl config use-context'

    ## Pay Respects (thefuck replacement)
    pay-respects fish --alias | source

    ## Nix Darwin
    alias nrs='sudo darwin-rebuild switch --flake ~/Dotfiles/.config/nix#MacBook-Pro'
    alias update='nix flake update --flake ~/Dotfiles/.config/nix'
    alias upgrade='update && nrs'

    ## Nix In General
    abbr --add nixos-rebuild 'nix run nixpkgs#nixos-rebuild --'

    ## Simple Aliases (Single Letter Commands)
    alias v=nvim
    alias y=yazi

    # Enabling TMUX if not already
    if not set -q TMUX
        tmux
    end
end

function fish_greeting

end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/Maaz/.lmstudio/bin
# End of LM Studio CLI section

set -gx ANTHROPIC_BASE_URL http://100.78.238.25:11434
set -gx ANTHROPIC_AUTH_TOKEN ollama

alias cea="bunx create-expo-app --no-install"

export PATH="$HOME/.local/bin:$PATH"

export CPM_SOURCE_CACHE="/Users/Maaz/.cache/cpm_cache"

export VCPKG_ROOT="$HOME/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"

set -gx GPG_TTY (tty)

set -gx PATH (brew --prefix rustup)/bin "$HOME/.cargo/bin" $PATH

export PATH="/opt/homebrew/bin:$PATH"

set -gx HOMEBREW_NO_ENV_HINTS 1

set -gx EDITOR nvim
