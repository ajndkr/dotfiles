# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). This
repository contains configuration files for shell, Git, development tools, and
custom utilities.

## Features

- **Shell:** Fish shell with Fisher plugin manager
- **Package Management:** Homebrew (macOS/Linux)
- **Python:** uv with Python 3.12
- **Rust:** rustup toolchain manager
- **Git:** Configured with GPG signing, useful aliases, and global ignore
- **Custom Functions:** Git and Conda workflow helpers

## Prerequisites

- Git
- curl or wget
- (Optional) Existing chezmoi installation

## Installation

### Quick Install

On a new machine, run:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ajndkr
chsh -s $(which fish)
```

This will:

1. Install chezmoi if not present
2. Initialize and apply all dotfiles
3. Prompt for personal information (name, email, GPG signing key)
4. Run the bootstrap script to install packages and tools
5. Set Fish as the default shell

### What Gets Installed

The bootstrap script (`run_once_before_install-packages.sh.tmpl`) automatically:

- Installs Homebrew (if not present)
- Installs all packages from `Brewfile`
- Initializes Rust toolchain (if needed)
- Sets up Python 3.12 via uv
- Installs Fish plugins via Fisher

### Manual Steps

After installation, you may want to:

1. **Configure Git signing key** (if not done during init):

   ```bash
   git config --global user.signingkey YOUR_KEY_ID
   ```

2. **Install Conda** (if needed):
   - macOS: `brew install --cask miniconda`
   - Linux: Download and install from
     [miniconda.io](https://docs.conda.io/en/latest/miniconda.html)

3. **Set up Google Cloud SDK** (optional):
   - Follow
     [official installation guide](https://cloud.google.com/sdk/docs/install)

## Included Configuration

### Shell (Fish)

- **Plugins:**
  - `fisher` - Plugin manager
  - `fzf.fish` - Fuzzy finder integration
  - `z` - Directory jumping
- **Prompt:** Starship - Cross-shell prompt

- **Aliases:**
  - `ll` - `ls -lah`
  - `g` - `git`
  - `c` - `cursor`
  - `py` - `python3`

- **Environment:**
  - Editor set to `cursor`
  - PATH includes `~/.cargo/bin` and `~/.local/bin`
  - Conda initialization (if installed)
  - uv shell completion

### Git

- GPG commit signing enabled
- Pull with rebase by default
- Auto-setup remote on push
- Global ignore file configured
- Useful aliases: `st`, `co`, `br`, `lg`

### Homebrew Packages

See `Brewfile` for the complete list. Includes:

- Development tools: `git`, `go`, `rustup`, `uv`
- Utilities: `fzf`, `tmux`, `htop`, `tree`, `ncdu`
- CLI tools: `gh`, `gum`, `pulumi`, `prettier`
- Media tools: `ffmpeg`, `exiftool`
- Fonts: Source Code Pro

## Custom Commands

Custom Fish functions for common workflows:

### Git Commands

| Command | Description                                                           |
| ------- | --------------------------------------------------------------------- |
| `gsync` | Sync current branch: stash changes → pull with rebase → restore stash |
| `gsw`   | Interactive branch switching using fzf                                |
| `gdel`  | Interactive branch deletion with fzf                                  |

## Project Structure

```
dotfiles/
├── .chezmoi.toml.tmpl          # Chezmoi configuration template
├── .chezmoiignore              # Files to ignore in chezmoi
├── Brewfile                    # Homebrew packages
├── dot_config/
│   ├── fish/
│   │   ├── config.fish.tmpl    # Fish shell configuration
│   │   ├── fish_plugins        # Fisher plugin list
│   │   └── functions/          # Custom Fish functions
│   └── gh/
│       └── config.yml          # GitHub CLI configuration
├── dot_gitconfig.tmpl          # Git configuration template
├── dot_gitignore_global        # Global Git ignore patterns
└── run_once_before_install-packages.sh.tmpl  # Bootstrap script
```

## Platform Support

- **macOS:** Fully supported (primary platform)
- **Linux:** Supported with platform-specific adjustments

The configuration automatically detects the OS and applies appropriate settings.

## Updating

To update your dotfiles on any machine:

```bash
chezmoi update
```

This will pull the latest changes and apply them to your system.

## Customization

All configuration files use chezmoi templates. To modify:

1. Edit files in the repository
2. Use `chezmoi edit <file>` to edit and apply changes
3. Commit and push changes

## License

See [LICENSE](LICENSE) file for details.
