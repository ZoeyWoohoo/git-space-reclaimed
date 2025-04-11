#!/bin/bash

# 检查是否在 Git 仓库中
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "$(get_message "not_git_repo")"
    exit 1
fi

# 国际化支持
get_lang() {
    # 如果指定了 --cn 参数，强制使用中文
    if [ "$force_cn" = true ]; then
        echo "zh_CN"
        return
    fi
    
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
                "not_git_repo") echo "错误: 当前目录不是 Git 仓库" ;;
                "usage") echo "使用方法: $0 [选项] [commit-hash]" ;;
                "options") echo "选项:" ;;
                "help_opt") echo "  --h    显示此帮助信息" ;;
                "debug_opt") echo "  --v    显示调试信息" ;;
                "cn_opt") echo "  --cn   强制使用中文输出" ;;
                "params") echo "参数:" ;;
                "commit_param") echo "  commit-hash    要分析的 Git 提交哈希值（可选，默认为 HEAD）" ;;
                "examples") echo "示例:" ;;
                "example1") echo "  $0                 # 分析当前提交（HEAD）" ;;
                "example2") echo "  $0 --v             # 分析当前提交并显示调试信息" ;;
                "example3") echo "  $0 abc123          # 分析指定的提交" ;;
                "example4") echo "  $0 --v abc123      # 分析指定的提交并显示调试信息" ;;
                "example5") echo "  $0 abc123 --v      # 同上，参数顺序可调" ;;
                "example6") echo "  $0 --cn            # 使用中文输出" ;;
                "processing_line") echo "处理行: $line" ;;
                "file_path") echo "文件路径: $file_path" ;;
                "matched_image") echo "匹配到图片文件，大小: $size" ;;
                "total_size") echo "删除图片资源文件总大小: $total 字节 ($mb MB)" ;;
            esac
            ;;
        *)
            case "$1" in
                "not_git_repo") echo "Error: Not a Git repository" ;;
                "usage") echo "Usage: $0 [options] [commit-hash]" ;;
                "options") echo "Options:" ;;
                "help_opt") echo "  --h    Show this help message" ;;
                "debug_opt") echo "  --v    Show debug information" ;;
                "cn_opt") echo "  --cn    Force Chinese output" ;;
                "params") echo "Parameters:" ;;
                "commit_param") echo "  commit-hash    Git commit hash to analyze (optional, defaults to HEAD)" ;;
                "examples") echo "Examples:" ;;
                "example1") echo "  $0                 # Analyze current commit (HEAD)" ;;
                "example2") echo "  $0 --v             # Analyze current commit with debug info" ;;
                "example3") echo "  $0 abc123          # Analyze specific commit" ;;
                "example4") echo "  $0 --v abc123      # Analyze specific commit with debug info" ;;
                "example5") echo "  $0 abc123 --v      # Same as above, parameter order flexible" ;;
                "example6") echo "  $0 --cn            # Use Chinese output" ;;
                "processing_line") echo "Processing line: $line" ;;
                "file_path") echo "File path: $file_path" ;;
                "matched_image") echo "Matched image file, size: $size" ;;
                "total_size") echo "Total size of deleted image files: $total bytes ($mb MB)" ;;
            esac
            ;;
    esac
}

# 初始化变量
debug_mode=false
force_cn=false
commit_hash="HEAD"

# 解析命令行参数
for arg in "$@"; do
    case "$arg" in
        --h)
            show_help
            ;;
        --v)
            debug_mode=true
            ;;
        --cn)
            force_cn=true
            ;;
        *)
            if [ "$commit_hash" = "HEAD" ]; then
                commit_hash=$arg
            fi
            ;;
    esac
done

# 显示帮助信息
show_help() {
    echo "$(get_message "usage")"
    echo
    echo "$(get_message "options")"
    echo "$(get_message "help_opt")"
    echo "$(get_message "debug_opt")"
    echo "$(get_message "cn_opt")"
    echo
    echo "$(get_message "params")"
    echo "$(get_message "commit_param")"
    echo
    echo "$(get_message "examples")"
    echo "$(get_message "example1")"
    echo "$(get_message "example2")"
    echo "$(get_message "example3")"
    echo "$(get_message "example4")"
    echo "$(get_message "example5")"
    echo "$(get_message "example6")"
    exit 0
}

# 创建临时文件
temp_file=$(mktemp)

# 获取 git diff 输出并处理
git diff --stat "$commit_hash^" "$commit_hash" | while read -r line; do
    # 调试输出
    if [ "$debug_mode" = true ]; then
        echo "$(get_message "processing_line")" >&2
    fi
    
    # 使用 grep 匹配包含 "Bin" 和 "-> 0 bytes" 的行
    if echo "$line" | grep -q "Bin.*-> 0 bytes"; then
        # 提取文件路径（在 | 之前的字符串）
        file_path=$(echo "$line" | cut -d'|' -f1 | tr -d ' ')
        
        # 调试输出
        if [ "$debug_mode" = true ]; then
            echo "$(get_message "file_path")" >&2
        fi
        
        # 检查文件扩展名
        if echo "$file_path" | grep -qE "\.(webp|png|jpg|jpeg|gif|bmp)$"; then
            # 提取文件大小（在 "Bin" 和 "->" 之间的数字）
            size=$(echo "$line" | grep -o "Bin [0-9]*" | cut -d' ' -f2)
            if [ ! -z "$size" ]; then
                if [ "$debug_mode" = true ]; then
                    echo "$(get_message "matched_image")" >&2
                fi
                echo "$size" >> "$temp_file"
            fi
        fi
    fi
done

# 计算总大小
total=0
while read -r size; do
    total=$((total + size))
done < "$temp_file"

# 删除临时文件
rm "$temp_file"

# 计算 MB（保留两位小数）
mb=$(printf "%.2f" $(echo "scale=2; $total/1024/1024" | bc))

# 输出总大小（以字节和 MB 为单位）
echo "$(get_message "total_size")" 