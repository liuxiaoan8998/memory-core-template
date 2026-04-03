#!/bin/bash
# Memory Log Helper Script
# Usage: ./memlog.sh "标题" "内容"

# 配置
MEMORY_DIR="${MEMORY_DIR:-$HOME/.openclaw/workspace/memory}"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)
LOG_FILE="$MEMORY_DIR/$DATE.md"

# 参数检查
if [ $# -lt 1 ]; then
    echo "Usage: ./memlog.sh \"标题\" [\"内容\"]"
    exit 1
fi

TITLE="$1"
CONTENT="${2:-}"

# 创建日志条目
LOG_ENTRY="### $TIME — $TITLE

${CONTENT}

---

"

# 追加到日志文件
if [ -f "$LOG_FILE" ]; then
    echo "$LOG_ENTRY" >> "$LOG_FILE"
else
    # 创建新文件并添加标题
    echo "# $DATE 记忆日志

$LOG_ENTRY" > "$LOG_FILE"
fi

echo "✅ 已记录到 $LOG_FILE"
echo "标题: $TITLE"
if [ -n "$CONTENT" ]; then
    echo "内容预览: ${CONTENT:0:50}..."
fi