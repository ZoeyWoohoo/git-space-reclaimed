# Git Space Reclaimed

**English** | [中文](README_CN.md)

A tool for analyzing and reporting the amount of storage space reclaimed by deleting image files in Git repositories.

## Features

- Calculate the storage space reclaimed by deleted image files in specified Git commits
- Support multiple image formats (webp, png, jpg, jpeg, gif, bmp)
- Display total reclaimed space (bytes and MB)
- Debug mode support
- Can be used in any Git repository
- Internationalization support (English/Chinese)
- Force Chinese output with --cn option

## Installation

### Option 1: Homebrew Tap (Recommended)

```bash
# Add the tap
brew tap zoeywoohoo/barn

# Install git-space-reclaimed
brew install git-space-reclaimed
```

### Option 2: One-click installation

```bash
curl -sSL https://raw.githubusercontent.com/ZoeyWoohoo/git-space-reclaimed/main/install.sh | sudo bash
```

## Usage

```bash
# Analyze current commit (HEAD)
git-space-reclaimed

# Analyze current commit with debug info
git-space-reclaimed [--v|-v|--verbose|-verbose]

# Analyze specific commit
git-space-reclaimed <commit-hash>

# Analyze specific commit with debug info
git-space-reclaimed [--v|-v|--verbose|-verbose] <commit-hash>

# Show help information
git-space-reclaimed [--h|-h|--help|-help]

# Force Chinese output
git-space-reclaimed --cn

# Combine options (order doesn't matter)
git-space-reclaimed --cn [--v|-v|--verbose|-verbose]
```

## Notes

- Must be run in a Git repository directory
- Requires Git command
- Requires bc command (for calculations)

## License

[MIT License](LICENSE)
