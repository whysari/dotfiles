# =============================================================================
# ~/.config/shell/aliases.sh — Shared across Zsh (macOS) & Bash (Windows/Linux)
# =============================================================================

# --- Navigation ---
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# --- Modern CLI Fallbacks (uses eza/bat if installed, standard ls/cat otherwise) ---
if command -v eza >/dev/null 2>&1; then
    alias ls="eza --icons --group-directories-first"
    alias ll="eza -la --icons --group-directories-first --git"
    alias lt="eza --tree --level=2 --icons"
else
    alias ll="ls -la"
    alias la="ls -A"
fi

if command -v bat >/dev/null 2>&1; then
    alias cat="bat --paging=never"
fi

# --- Git Shortcuts ---
alias g="git"
alias gs="git status -sb"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate -n 20"
alias gp="git push"
alias gpl="git pull"

# --- Dotfiles (Chezmoi) Shortcuts ---
alias dot="chezmoi"
alias dota="chezmoi apply"
alias dotd="chezmoi diff"
alias dots="chezmoi status"
alias dotcd="chezmoi cd"
