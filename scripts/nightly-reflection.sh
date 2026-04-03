#!/bin/bash
# Memory Core Nightly Reflection Script
# Usage: ./scripts/nightly-reflection.sh
# This script generates reflection material for deep reflection

WORKSPACE="${WORKSPACE:-$HOME/.openclaw/workspace}"
MEMORY_DIR="$WORKSPACE/memory"
DATE=$(date +%Y-%m-%d)
YESTERDAY=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d "yesterday" +%Y-%m-%d)
PREP_FILE="$MEMORY_DIR/${DATE}-reflection-prep.md"

echo "🌙 Memory Core Nightly Reflection - $DATE"
echo "Workspace: $WORKSPACE"

# Check directories
if [ ! -d "$MEMORY_DIR" ]; then
    echo "❌ Error: memory/ directory not found"
    exit 1
fi

# Check if yesterday's log exists
YESTERDAY_LOG="$MEMORY_DIR/$YESTERDAY.md"
if [ ! -f "$YESTERDAY_LOG" ]; then
    echo "⚠️  No activity logged for $YESTERDAY"
    echo "Skipping reflection prep generation"
    exit 0
fi

# Generate reflection prep
cat > "$PREP_FILE" << EOF
# Reflection Prep - $DATE

**Source**: $YESTERDAY.md  
**Generated**: $(date +%H:%M)

---

## 昨日活动摘要

$(grep "^###" "$YESTERDAY_LOG" | head -10)

## 关键决策（如有）

$(grep -A 3 "关键决策" "$YESTERDAY_LOG" | head -20)

## 待办事项

$(grep "^- \[ \]" "$YESTERDAY_LOG" | head -10)

## 问题与教训

$(grep -A 2 "问题\|教训\|踩坑" "$YESTERDAY_LOG" | head -30)

---

## 反思提示

1. 昨日核心主题是什么？
2. 有什么重要决策？决策质量如何？
3. 遇到了什么问题？如何解决的？
4. 有什么可以提取为教训的？
5. 今日待办是否合理？
6. 有什么长期思考？

---

**下一步**: 基于以上内容，执行深度反思（01:00）
EOF

echo "✅ Reflection prep generated: $PREP_FILE"
echo "🌙 Nightly reflection prep complete"