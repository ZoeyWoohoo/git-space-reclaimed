# Git Space Reclaimed

[English](#english) | [中文](#chinese)

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

---

<h2 id="chinese">中文</h2>

一个用于分析和报告 Git 仓库中删除图片文件后回收的存储空间大小的工具。

## 功能特点

- 计算指定 Git 提交中删除图片文件后回收的存储空间
- 支持多种图片格式（webp、png、jpg、jpeg、gif、bmp）
- 显示回收的总空间（字节和 MB）
- 支持调试模式
- 可在任何 Git 仓库中使用
- 支持国际化（中英文）
- 支持通过 --cn 参数强制使用中文输出

## 安装方法

使用以下命令一键安装：

```bash
curl -sSL https://raw.githubusercontent.com/ZoeyWoohoo/git-space-reclaimed/main/install.sh | sudo bash
```

## 使用方法

```bash
# 分析当前提交（HEAD）
git-space-reclaimed

# 分析当前提交并显示调试信息
git-space-reclaimed --v

# 分析指定的提交
git-space-reclaimed <commit-hash>

# 分析指定的提交并显示调试信息
git-space-reclaimed --v <commit-hash>

# 显示帮助信息
git-space-reclaimed --h

# 强制使用中文输出
git-space-reclaimed --cn

# 组合使用选项（顺序无关）
git-space-reclaimed --cn --v
git-space-reclaimed --v --cn
```

## 语言选择

脚本会自动检测系统语言并显示相应的消息。你可以：

1. 使用环境变量：
```bash
# 使用中文
export LANG=zh_CN.UTF-8
git-space-reclaimed

# 使用英文
export LANG=en_US.UTF-8
git-space-reclaimed
```

2. 使用 --cn 参数强制中文输出：
```bash
git-space-reclaimed --cn
```

## 注意事项

- 必须在 Git 仓库目录中运行
- 需要 Git 命令可用
- 需要 bc 命令可用（用于计算）

## 许可证

MIT License 