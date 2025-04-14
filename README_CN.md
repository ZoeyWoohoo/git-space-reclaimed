# Git Space Reclaimed

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

### 方式一：使用 Homebrew Tap（推荐）

```bash
# 添加 tap 仓库
brew tap zoeywoohoo/barn

# 安装 git-space-reclaimed
brew install git-space-reclaimed
```

### 方式二：一键安装

使用以下命令一键安装：

```bash
curl -sSL https://raw.githubusercontent.com/ZoeyWoohoo/git-space-reclaimed/main/install.sh | sudo bash
```

## 使用方法

```bash
# 分析当前提交（HEAD）
git-space-reclaimed

# 分析当前提交并显示调试信息
git-space-reclaimed [--v|-v|--verbose|-verbose]

# 分析指定的提交
git-space-reclaimed <commit-hash>

# 分析指定的提交并显示调试信息
git-space-reclaimed [--v|-v|--verbose|-verbose] <commit-hash>

# 显示帮助信息
git-space-reclaimed [--h|-h|--help|-help]

# 强制使用中文输出
git-space-reclaimed --cn

# 组合使用选项（顺序无关）
git-space-reclaimed --cn [--v|-v|--verbose|-verbose]
```

## 注意事项

- 必须在 Git 仓库目录中运行
- 需要 Git 命令可用
- 需要 bc 命令可用（用于计算）

## 许可证

本项目采用 [MIT 许可证](LICENSE)
