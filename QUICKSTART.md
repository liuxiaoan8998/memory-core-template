# Quick Start Guide

Get Memory Core running in 5 minutes.

## Prerequisites

- OpenClaw installed and running
- Git (for cloning)
- Basic terminal knowledge

## Step 1: Clone and Prepare

```bash
# Clone the template
git clone https://github.com/liuxiaoan8998/memory-core-template.git
cd memory-core-template

# Make scripts executable
chmod +x scripts/*.sh
```

## Step 2: Backup Existing Agent (Important!)

```bash
cd ~/.openclaw/workspace

# Backup existing files
cp MEMORY.md MEMORY.md.backup.$(date +%Y%m%d)
cp AGENTS.md AGENTS.md.backup.$(date +%Y%m%d)
cp -r memory memory.backup.$(date +%Y%m%d) 2>/dev/null || true

echo "✅ Backup complete"
```

## Step 3: Create Directory Structure

```bash
# Create memory directories
mkdir -p memory/{lessons,decisions,projects,preferences,reflections}

# Create core files
touch memory/NOW.md
touch memory/INDEX.md
```

## Step 4: Copy Template Files

```bash
# From the cloned template
cd /path/to/memory-core-template

# Copy templates (don't overwrite existing!)
cp memory/NOW.md ~/.openclaw/workspace/memory/
cp memory/INDEX.md ~/.openclaw/workspace/memory/
```

## Step 5: Merge Configuration

### Update MEMORY.md

Add to your existing `MEMORY.md`:

```markdown
## Memory Core

- **Trigger words**: "记住这个", "一直记住", "永久记忆", "别忘了", "永远记住"
- **Decisions**: See `memory/decisions/`
- **Lessons**: See `memory/lessons/`
```

### Update AGENTS.md

Add to your existing `AGENTS.md`:

```markdown
## Memory Routing

New content → appropriate directory:
- Lessons → `memory/lessons/`
- Decisions → `memory/decisions/`
- Projects → `memory/projects/`
- Preferences → `memory/preferences/`
- Daily logs → `memory/YYYY-MM-DD.md`
```

## Step 6: Verify Installation

```bash
# Run verification
./scripts/verify-memory-structure.sh

# Run tests
./scripts/run-tests.sh
```

**Expected output**: All checks pass ✅

## Step 7: Test Memory Function

Start a conversation with your Agent:

```
You: 记住这个：测试记忆系统
Agent: 已永久记忆：测试记忆系统
```

Check if it was recorded:

```bash
cat ~/.openclaw/workspace/memory/$(date +%Y-%m-%d).md
```

## Step 8: Configure Cron (Optional)

Add to `~/.openclaw/config.yaml`:

```yaml
cron:
  jobs:
    - name: memory-heartbeat
      schedule: "0 * * * *"
      command: "Read HEARTBEAT.md if it exists"
```

## Done! 🎉

Memory Core is now active. See [USAGE.md](USAGE.md) for daily usage.

## Troubleshooting

### Tests fail

```bash
# Check structure
ls -la ~/.openclaw/workspace/memory/

# Check files
cat ~/.openclaw/workspace/memory/NOW.md
```

### Memory not recording

- Check AGENTS.md has routing rules
- Check trigger words are correct
- Check file permissions

### Need help?

- See [SETUP.md](SETUP.md) for detailed guide
- See [TEST.md](TEST.md) for testing
- Open an issue on GitHub

## Next Steps

1. Read [ARCHITECTURE.md](ARCHITECTURE.md) to understand the system
2. Check out the templates in `memory/lessons/`, `memory/decisions/`
3. Customize for your needs
4. Share your experience!