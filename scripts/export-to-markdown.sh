#!/bin/bash
# Export Memory Core to Markdown
# Usage: ./scripts/export-to-markdown.sh [output_dir]

OUTPUT_DIR="${1:-./memory-core-export}"
WORKSPACE="${WORKSPACE:-$HOME/.openclaw/workspace}"
MEMORY_DIR="$WORKSPACE/memory"
DATE=$(date +%Y-%m-%d)

echo "📦 Exporting Memory Core to Markdown..."
echo "Source: $WORKSPACE"
echo "Output: $OUTPUT_DIR"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Export main files
echo "📄 Exporting main files..."
cp "$WORKSPACE/MEMORY.md" "$OUTPUT_DIR/"
cp "$WORKSPACE/HEARTBEAT.md" "$OUTPUT_DIR/" 2>/dev/null || echo "HEARTBEAT.md not found"
cp "$WORKSPACE/AGENTS.md" "$OUTPUT_DIR/" 2>/dev/null || echo "AGENTS.md not found"

# Export memory directory
echo "📁 Exporting memory/..."
mkdir -p "$OUTPUT_DIR/memory"
cp -r "$MEMORY_DIR/"* "$OUTPUT_DIR/memory/" 2>/dev/null || echo "memory/ empty or not found"

# Create index
cat > "$OUTPUT_DIR/README.md" << EOF
# Memory Core Export

**Export Date**: $DATE  
**Source**: $WORKSPACE

---

## Contents

- MEMORY.md - Core memory
- HEARTBEAT.md - Heartbeat configuration
- AGENTS.md - Agent behavior guidelines
- memory/ - Memory directory
  - NOW.md - Current priorities
  - INDEX.md - Knowledge index
  - lessons/ - Lessons learned
  - decisions/ - Major decisions
  - projects/ - Project tracking
  - preferences/ - User preferences
  - reflections/ - Deep reflections
  - YYYY-MM-DD.md - Daily logs

---

## Usage

This is a snapshot of the Memory Core system at $DATE.

To restore:
1. Copy files back to workspace
2. Run: ./scripts/verify-memory-structure.sh
3. Run: ./scripts/run-tests.sh
EOF

echo "✅ Export complete: $OUTPUT_DIR"
echo "📦 Files exported:"
ls -la "$OUTPUT_DIR/"