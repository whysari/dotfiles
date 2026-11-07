# Dotfiles (`whysari`)

Cross-platform dotfiles managed with **[Chezmoi](https://www.chezmoi.io/)**:
- **macOS:** Ghostty + Zsh + Starship + Homebrew (`Brewfile`)
- **Windows:** PowerShell (Windows PowerShell / pwsh) & Bash (Git Bash / WSL) + Starship
- **Linux:** Bash / Zsh + Ghostty + Starship

---

## Repository Structure

```text
dotfiles/
├── .chezmoi.toml.tmpl                 # Identity & OS detection (darwin, windows, linux, WSL)
├── .chezmoiignore                     # Excludes macOS/Windows specific files per platform
├── Brewfile                           # macOS Homebrew formulae, casks, fonts & VS Code extensions
├── dot_gitconfig.tmpl                 # Shared Git config (auto-handles CRLF on Windows vs Unix)
├── dot_zshrc.tmpl                     # macOS Zsh config
├── dot_bashrc.tmpl                    # Windows (Git Bash / WSL) & Linux Bash config
├── dot_bash_profile                   # Ensures login shells source ~/.bashrc
├── dot_Documents/                     # Windows-only PowerShell profiles
│   ├── PowerShell/
│   │   └── Microsoft.PowerShell_profile.ps1         # PowerShell 7 profile (Starship + PSReadLine)
│   └── WindowsPowerShell/
│       └── Microsoft.PowerShell_profile.ps1         # Windows PowerShell 5.1 profile
├── dot_config/
│   ├── ghostty/
│   │   └── config.tmpl                # Ghostty config (Catppuccin Mocha + Quake dropdown + splits)
│   ├── shell/
│   │   ├── aliases.sh                 # Shared POSIX aliases loaded by both Zsh and Bash
│   │   └── functions.sh               # Shared POSIX helper functions loaded by both Zsh and Bash
│   └── starship.toml                  # Catppuccin Mocha Starship prompt shared across Zsh, Bash & PowerShell
└── .chezmoiscripts/
    └── run_onchange_brew-bundle.sh.tmpl # Auto-syncs Brewfile when modified on macOS
```

---

## Preview & Apply Changes Locally

```bash
# Preview changes without modifying $HOME
chezmoi diff

# Apply changes to $HOME
chezmoi apply -v
```

---

## Bootstrapping on a New Machine

Once pushed to a GitHub repository (e.g. `github.com/whysari/dotfiles`):

### macOS / Linux / WSL
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply whysari
```

### Windows (PowerShell or Git Bash)
```powershell
winget install twpayne.chezmoi
chezmoi init --apply whysari
```
