#!/bin/bash
# Memory Core Structure Verification Script
# Usage: ./scripts/verify-memory-structure.sh [workspace_path]

WORKSPACE="${1:-$HOME/.openclaw/workspace}"
ERRORS=0

echo "🔍 Verifying Memory Core structure in: $WORKSPACE"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if directory exists
check_dir() {
    if [ -d "$WORKSPACE/$1" ]; then
        echo -e "${GREEN}✅${NC} $1/ exists"
    else
        echo -e "${RED}❌${NC} $1/ missing"
        ERRORS=$((ERRORS + 1))
    fi
}

# Function to check if file exists
check_file() {
    if [ -f "$WORKSPACE/$1" ]; then
        echo -e "${GREEN}✅${NC} $1 exists"
    else
        echo -e "${RED}❌${NC} $1 missing"
        ERRORS=$((ERRORS + 1))
    fi
}

# Function to check if file contains text
check_file_contains() {
    if [ -f "$WORKSPACE/$1" ]; then
        if grep -q "$2" "$WORKSPACE/$1"; then
            echo -e "${GREEN}✅${NC} $1 contains: $2"
        else
            echo -e "${YELLOW}⚠️${NC}  $1 missing: $2"
            ERRORS=$((ERRORS + 1))
        fi
    else
        echo -e "${RED}❌${NC} $1 not found"
        ERRORS=$((ERRORS + 1))
    fi
}

echo "📁 Checking directories..."
check_dir "memory"
check_dir "memory/lessons"
check_dir "memory/decisions"
check_dir "memory/projects"
check_dir "memory/preferences"
check_dir "memory/reflections"

echo ""
echo "📄 Checking files..."
check_file "memory/NOW.md"
check_file "memory/INDEX.md"
check_file "MEMORY.md"
check_file "AGENTS.md"
check_file "HEARTBEAT.md"

echo ""
echo "🔍 Checking content..."
check_file_contains "MEMORY.md" "永久记忆触发词"
check_file_contains "MEMORY.md" "memory/decisions/"
check_file_contains "MEMORY.md" "memory/lessons/"
check_file_contains "AGENTS.md" "Memory Core"
check_file_contains "AGENTS.md" "lessons/"
check_file_contains "HEARTBEAT.md" "HEARTBEAT_OK"

echo ""
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}🎉 All checks passed! Memory Core is properly configured.${NC}"
    exit 0
else
    echo -e "${RED}⚠️  Found $ERRORS issue(s). Please review the checklist in SETUP.md${NC}"
    exit 1
fi