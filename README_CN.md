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

MIT 许可证

版权所有 (c) 2025 Zoey

特此免费授予任何获得本软件和相关文档文件（"软件"）副本的人不受限制地处理本软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，并允许向其提供软件的人这样做，但须符合以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

本软件按"原样"提供，不提供任何形式的明示或暗示的保证，包括但不限于对适销性、特定用途的适用性和非侵权性的保证。在任何情况下，作者或版权持有人均不对任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权行为或其他方面，由软件或软件的使用或其他交易引起的或与之相关的。 