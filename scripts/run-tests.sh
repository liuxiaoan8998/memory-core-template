#!/bin/bash
# Memory Core Test Suite
# Usage: ./scripts/run-tests.sh [workspace_path]

WORKSPACE="${1:-$HOME/.openclaw/workspace}"
ERRORS=0

echo "🧪 Running Memory Core Tests..."
echo "Workspace: $WORKSPACE"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Test 1: Structure
echo "📁 Test 1: Directory structure..."
if [ -d "$WORKSPACE/memory/lessons" ] && [ -d "$WORKSPACE/memory/decisions" ] && [ -d "$WORKSPACE/memory/projects" ] && [ -d "$WORKSPACE/memory/preferences" ] && [ -d "$WORKSPACE/memory/reflections" ]; then
    echo -e "${GREEN}✅${NC} All directories exist"
else
    echo -e "${RED}❌${NC} Some directories missing"
    ERRORS=$((ERRORS + 1))
fi

# Test 2: Required files
echo ""
echo "📄 Test 2: Required files..."
for file in "MEMORY.md" "AGENTS.md" "HEARTBEAT.md" "memory/NOW.md" "memory/INDEX.md"; do
    if [ -f "$WORKSPACE/$file" ]; then
        echo -e "${GREEN}✅${NC} $file exists"
    else
        echo -e "${RED}❌${NC} $file missing"
        ERRORS=$((ERRORS + 1))
    fi
done

# Test 3: Content checks
echo ""
echo "🔍 Test 3: Content checks..."
if grep -q "永久记忆触发词" "$WORKSPACE/MEMORY.md"; then
    echo -e "${GREEN}✅${NC} MEMORY.md contains trigger words"
else
    echo -e "${RED}❌${NC} MEMORY.md missing trigger words"
    ERRORS=$((ERRORS + 1))
fi

if grep -q "lessons/" "$WORKSPACE/AGENTS.md"; then
    echo -e "${GREEN}✅${NC} AGENTS.md contains lessons route"
else
    echo -e "${RED}❌${NC} AGENTS.md missing lessons route"
    ERRORS=$((ERRORS + 1))
fi

# Test 4: File creation
echo ""
echo "🆕 Test 4: File creation..."
TEST_FILE="$WORKSPACE/memory/test-$$.md"
if echo "test" > "$TEST_FILE" && rm "$TEST_FILE"; then
    echo -e "${GREEN}✅${NC} Can create files in memory/"
else
    echo -e "${RED}❌${NC} Cannot create files in memory/"
    ERRORS=$((ERRORS + 1))
fi

# Test 5: Template files
echo ""
echo "📋 Test 5: Template files..."
for template in "memory/lessons/example-lesson.md" "memory/decisions/example-decision.md" "memory/projects/example-project.md"; do
    if [ -f "$WORKSPACE/$template" ]; then
        echo -e "${GREEN}✅${NC} Template $template exists"
    else
        echo -e "${YELLOW}⚠️${NC}  Template $template not found (optional)"
    fi
done

# Summary
echo ""
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}🎉 All tests passed!${NC}"
    exit 0
else
    echo -e "${RED}⚠️  $ERRORS test(s) failed${NC}"
    echo "Check TEST.md for troubleshooting"
    exit 1
fi