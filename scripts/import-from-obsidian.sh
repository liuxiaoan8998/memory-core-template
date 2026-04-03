#!/bin/bash
# Import from Obsidian
# Usage: ./scripts/import-from-obsidian.sh <obsidian_vault_path>

OBSIDIAN_VAULT="${1:-}"
WORKSPACE="${WORKSPACE:-$HOME/.openclaw/workspace}"
MEMORY_DIR="$WORKSPACE/memory"

echo "📥 Importing from Obsidian..."

if [ -z "$OBSIDIAN_VAULT" ]; then
    echo "❌ Error: Please provide Obsidian vault path"
    echo "Usage: ./scripts/import-from-obsidian.sh /path/to/obsidian/vault"
    exit 1
fi

if [ ! -d "$OBSIDIAN_VAULT" ]; then
    echo "❌ Error: Obsidian vault not found: $OBSIDIAN_VAULT"
    exit 1
fi

echo "Source: $OBSIDIAN_VAULT"
echo "Target: $MEMORY_DIR"

# Create directories
mkdir -p "$MEMORY_DIR/lessons"
mkdir -p "$MEMORY_DIR/decisions"
mkdir -p "$MEMORY_DIR/projects"

# Import daily notes (if they follow YYYY-MM-DD pattern)
echo "📅 Importing daily notes..."
for file in "$OBSIDIAN_VAULT"/*.md; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        # Check if filename matches date pattern
        if [[ $filename =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}\.md$ ]]; then
            echo "  Importing: $filename"
            cp "$file" "$MEMORY_DIR/"
        fi
    fi
done

# Import from specific folders
echo "📚 Importing from folders..."

# Lessons
if [ -d "$OBSIDIAN_VAULT/lessons" ]; then
    echo "  Importing lessons/..."
    cp -r "$OBSIDIAN_VAULT/lessons/"* "$MEMORY_DIR/lessons/" 2>/dev/null || true
fi

# Decisions
if [ -d "$OBSIDIAN_VAULT/decisions" ]; then
    echo "  Importing decisions/..."
    cp -r "$OBSIDIAN_VAULT/decisions/"* "$MEMORY_DIR/decisions/" 2>/dev/null || true
fi

# Projects
if [ -d "$OBSIDIAN_VAULT/projects" ]; then
    echo "  Importing projects/..."
    cp -r "$OBSIDIAN_VAULT/projects/"* "$MEMORY_DIR/projects/" 2>/dev/null || true
fi

echo "✅ Import complete"
echo ""
echo "Next steps:"
echo "1. Run: ./scripts/verify-memory-structure.sh"
echo "2. Update memory/INDEX.md"
echo "3. Review imported files"