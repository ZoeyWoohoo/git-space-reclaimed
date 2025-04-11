#!/bin/bash

# 国际化支持
get_lang() {
    # 优先使用 LANGUAGE 环境变量
    if [ ! -z "$LANGUAGE" ]; then
        echo "$LANGUAGE" | cut -d':' -f1
    # 其次使用 LANG 环境变量
    elif [ ! -z "$LANG" ]; then
        echo "$LANG" | cut -d'.' -f1
    else
        echo "en_US"
    fi
}

# 根据语言获取消息
get_message() {
    local lang=$(get_lang)
    case "$lang" in
        zh_CN|zh_TW|zh)
            case "$1" in
                "need_sudo") echo "请使用 sudo 运行此安装脚本" ;;
                "downloading") echo "正在下载 git-space-reclaimed..." ;;
                "download_failed") echo "下载失败，请检查网络连接或 GitHub 仓库地址" ;;
                "install_success") echo "安装成功！" ;;
                "install_success_msg1") echo "现在你可以在任何目录使用 'git-space-reclaimed' 命令了" ;;
                "install_success_msg2") echo "使用 'git-space-reclaimed --h' 查看使用说明" ;;
                "install_failed") echo "安装失败，请检查权限或手动安装" ;;
                "usage") echo "使用方法: $0" ;;
                "options") echo "选项:" ;;
                "cn_opt") echo "  --cn   强制使用中文输出" ;;
            esac
            ;;
        *)
            case "$1" in
                "need_sudo") echo "Please run this installation script with sudo" ;;
                "downloading") echo "Downloading git-space-reclaimed..." ;;
                "download_failed") echo "Download failed. Please check your network connection or GitHub repository URL" ;;
                "install_success") echo "Installation successful!" ;;
                "install_success_msg1") echo "You can now use the 'git-space-reclaimed' command from any directory" ;;
                "install_success_msg2") echo "Use 'git-space-reclaimed --h' to view usage instructions" ;;
                "install_failed") echo "Installation failed. Please check permissions or install manually" ;;
                "usage") echo "Usage: $0" ;;
                "options") echo "Options:" ;;
                "cn_opt") echo "  --cn   Force Chinese output" ;;
            esac
            ;;
    esac
}

# 显示帮助信息
show_help() {
    echo "$(get_message "usage")"
    echo
    echo "$(get_message "options")"
    echo "$(get_message "cn_opt")"
    exit 0
}

# 设置安装目录
INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="git-space-reclaimed"

# 检查是否有 root 权限
if [ "$EUID" -ne 0 ]; then
    echo "$(get_message "need_sudo")"
    exit 1
fi

# 下载脚本
echo "$(get_message "downloading")"
curl -sSL "https://raw.githubusercontent.com/ZoeyWoohoo/git-space-reclaimed/main/git-space-reclaimed.sh" -o "/tmp/$SCRIPT_NAME"

# 检查下载是否成功
if [ $? -ne 0 ]; then
    echo "$(get_message "download_failed")"
    exit 1
fi

# 设置执行权限
chmod +x "/tmp/$SCRIPT_NAME"

# 移动到安装目录
mv "/tmp/$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"

# 检查安装是否成功
if [ $? -eq 0 ]; then
    echo "$(get_message "install_success")"
    echo "$(get_message "install_success_msg1")"
    echo "$(get_message "install_success_msg2")"
else
    echo "$(get_message "install_failed")"
    exit 1
fi 