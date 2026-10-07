if status is-interactive
    # Run fastfetch on terminal startup
    fastfetch

    # Modern colorized replacements
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -la --icons --group-directories-first'
    alias cat='bat'
end

set -g fish_greeting ""
fish_add_path ~/.local/bin
