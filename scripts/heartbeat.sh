#!/bin/bash
# Memory Core Heartbeat Script
# Usage: ./scripts/heartbeat.sh
# This script is called by OpenClaw cron every hour

WORKSPACE="${WORKSPACE:-$HOME/.openclaw/workspace}"
MEMORY_DIR="$WORKSPACE/memory"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)
LOG_FILE="$MEMORY_DIR/$DATE.md"

echo "💓 Memory Core Heartbeat - $DATE $TIME"
echo "Workspace: $WORKSPACE"

# Check if memory directory exists
if [ ! -d "$MEMORY_DIR" ]; then
    echo "❌ Error: memory/ directory not found"
    echo "Run: mkdir -p $MEMORY_DIR/{lessons,decisions,projects,preferences,reflections}"
    exit 1
fi

# Check if NOW.md exists
if [ ! -f "$MEMORY_DIR/NOW.md" ]; then
    echo "⚠️  Warning: NOW.md not found"
fi

# Check if INDEX.md exists
if [ ! -f "$MEMORY_DIR/INDEX.md" ]; then
    echo "⚠️  Warning: INDEX.md not found"
fi

# Create heartbeat entry if log file exists
if [ -f "$LOG_FILE" ]; then
    echo "" >> "$LOG_FILE"
    echo "### $TIME — 心跳检查" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    echo "过去60分钟内会话活动已记录。" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    echo "**当前状态**：" >> "$LOG_FILE"
    echo "- 系统运行正常" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    echo "---" >> "$LOG_FILE"
    echo "✅ Heartbeat logged to $LOG_FILE"
else
    echo "ℹ️  Daily log not created yet (no sessions)"
fi

echo "💓 Heartbeat complete"