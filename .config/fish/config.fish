if status is-interactive
    starship init fish | source
    zoxide init fish | source
    alias cd=z
    alias cat=/opt/homebrew/bin/bat
    alias ocat=/bin/cat
    alias docker=podman
    alias ls='eza --icons'
    alias ols=/bin/ls
    alias kubectx='kubectl config use-context'
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

export ANTHROPIC_BASE_URL=http://192.168.1.22:1234
#export ANTHROPIC_BASE_URL=http://127.0.0.1:1234
export ANTHROPIC_AUTH_TOKEN=lmstudio

alias cea="bunx create-expo-app --no-install"

export PATH="$HOME/.local/bin:$PATH"

export CPM_SOURCE_CACHE="/Users/Maaz/.cache/cpm_cache"

export VCPKG_ROOT="$HOME/vcpkg"
export PATH="$VCPKG_ROOT:$PATH"

set -x PATH (brew --prefix rustup)/bin $PATH

export PATH="/opt/homebrew/bin:$PATH"

set HOMEBREW_NO_ENV_HINTS 1
