# Dotfiles (`whysari`)

Cross-platform dotfiles managed with **[Chezmoi](https://www.chezmoi.io/)**:
- **macOS:** Ghostty + Zsh + Starship + Homebrew (`Brewfile`)
- **Windows:** Bash (Git Bash / WSL) + Starship
- **Linux:** Bash / Zsh + Ghostty + Starship

---

## Repository Structure

```text
dotfiles/
├── .chezmoi.toml.tmpl                 # Identity & OS detection (darwin, windows, linux, WSL)
├── .chezmoiignore                     # Excludes macOS-only files on Windows/Linux
├── Brewfile                           # macOS Homebrew formulae, casks, fonts & VS Code extensions
├── dot_gitconfig.tmpl                 # Shared Git config (auto-handles CRLF on Windows vs Unix)
├── dot_zshrc.tmpl                     # macOS Zsh config
├── dot_bashrc.tmpl                    # Windows (Git Bash / WSL) & Linux Bash config
├── dot_bash_profile                   # Ensures login shells source ~/.bashrc
├── dot_config/
│   ├── ghostty/
│   │   └── config.tmpl                # Ghostty config (Catppuccin Mocha + Quake dropdown + splits)
│   ├── shell/
│   │   ├── aliases.sh                 # Shared POSIX aliases loaded by both Zsh and Bash
│   │   └── functions.sh               # Shared POSIX helper functions loaded by both Zsh and Bash
│   └── starship.toml                  # Catppuccin Mocha Starship prompt shared across Zsh & Bash
└── .chezmoiscripts/
    └── run_onchange_brew-bundle.sh.tmpl # Auto-syncs Brewfile when modified on macOS
```

---

## Safe Preview & Testing (Without Touching `$HOME`)

Because this repository is staged in `/Users/ysr/.gemini/antigravity/scratch/dotfiles`, you can preview what Chezmoi would do before applying anything to your actual home directory:

```bash
# 1. Install chezmoi (if not yet installed)
brew install chezmoi

# 2. Initialize config from this scratch directory and run a dry-run diff
chezmoi init --source=/Users/ysr/.gemini/antigravity/scratch/dotfiles
chezmoi diff --source=/Users/ysr/.gemini/antigravity/scratch/dotfiles
```

When you are happy with the diff and ready to apply:

```bash
chezmoi apply --source=/Users/ysr/.gemini/antigravity/scratch/dotfiles --dry-run -v
# Remove --dry-run to apply for real:
chezmoi apply --source=/Users/ysr/.gemini/antigravity/scratch/dotfiles -v
```

---

## Bootstrapping on a New Machine

Once pushed to a GitHub repository (e.g. `github.com/whysari/dotfiles`):

### macOS / Linux / WSL
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply whysari
```

### Windows (Git Bash)
```bash
winget install twpayne.chezmoi
chezmoi init --apply whysari
```
