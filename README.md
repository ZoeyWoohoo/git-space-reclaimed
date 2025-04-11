# Git Space Reclaimed

[English](#english) | [中文](README_CN.md)

<h2 id="english">English</h2>

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

One-click installation:

```bash
curl -sSL https://raw.githubusercontent.com/ZoeyWoohoo/git-space-reclaimed/main/install.sh | sudo bash
```

## Usage

```bash
# Analyze current commit (HEAD)
git-space-reclaimed

# Analyze current commit with debug info
git-space-reclaimed --v

# Analyze specific commit
git-space-reclaimed <commit-hash>

# Analyze specific commit with debug info
git-space-reclaimed --v <commit-hash>

# Show help information
git-space-reclaimed --h

# Force Chinese output
git-space-reclaimed --cn

# Combine options (order doesn't matter)
git-space-reclaimed --cn --v
git-space-reclaimed --v --cn
```

## Language Selection

The script automatically detects your system language and displays messages accordingly. You can:

1. Use environment variables:
```bash
# Use Chinese
export LANG=zh_CN.UTF-8
git-space-reclaimed

# Use English
export LANG=en_US.UTF-8
git-space-reclaimed
```

2. Force Chinese output with --cn option:
```bash
git-space-reclaimed --cn
```

## Notes

- Must be run in a Git repository directory
- Requires Git command
- Requires bc command (for calculations)

## License

MIT License

Copyright (c) 2025 Zoey

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. 