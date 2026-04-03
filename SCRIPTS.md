# Memory Core 脚本说明

## 脚本列表

| 脚本 | 用途 | 使用频率 |
|-----|------|---------|
| `memlog.sh` | 记录日志到每日文件 | 每次会话 |
| `heartbeat.sh` | 每小时心跳检查 | 每小时（cron） |
| `nightly-reflection.sh` | 生成反思素材 | 每天 00:45（cron） |
| `verify-memory-structure.sh` | 验证目录结构 | 安装后/升级后 |
| `run-tests.sh` | 运行测试套件 | 安装后/升级后 |
| `export-to-markdown.sh` | 导出记忆为 Markdown | 按需 |
| `import-from-obsidian.sh` | 从 Obsidian 导入 | 一次性 |

---

## memlog.sh

**用途**: 记录日志条目到每日文件

**用法**:
```bash
./scripts/memlog.sh "标题" "内容"
```

**示例**:
```bash
./scripts/memlog.sh "用户会话" "讨论了项目进展"
```

**效果**: 在 `memory/2026-04-03.md` 中追加：
```markdown
### 14:30 — 用户会话

讨论了项目进展

---
```

---

## heartbeat.sh

**用途**: 每小时执行的记忆维护检查

**用法**:
```bash
./scripts/heartbeat.sh
```

**功能**:
- 检查 memory/ 目录是否存在
- 检查 NOW.md 和 INDEX.md 是否存在
- 在每日日志中记录心跳

**配置**（在 OpenClaw cron 中）:
```yaml
cron:
  jobs:
    - name: memory-heartbeat
      schedule: "0 * * * *"
      command: "./scripts/heartbeat.sh"
```

---

## nightly-reflection.sh

**用途**: 生成每日反思素材

**用法**:
```bash
./scripts/nightly-reflection.sh
```

**功能**:
- 读取昨日的每日日志
- 提取关键决策、待办、问题
- 生成反思提示
- 输出到 `memory/YYYY-MM-DD-reflection-prep.md`

**配置**（在 OpenClaw cron 中）:
```yaml
cron:
  jobs:
    - name: nightly-reflection-prep
      schedule: "45 0 * * *"
      command: "./scripts/nightly-reflection.sh"
```

---

## verify-memory-structure.sh

**用途**: 验证 Memory Core 目录结构

**用法**:
```bash
# 验证默认 workspace
./scripts/verify-memory-structure.sh

# 验证指定 workspace
./scripts/verify-memory-structure.sh /path/to/workspace
```

**检查项**:
- ✅ 所有目录存在（memory/, lessons/, decisions/ 等）
- ✅ 必需文件存在（NOW.md, INDEX.md, MEMORY.md 等）
- ✅ 关键内容存在（触发词、路由规则等）

**输出示例**:
```
🔍 Verifying Memory Core structure...

📁 Checking directories...
✅ memory/ exists
✅ lessons/ exists
...

🎉 All checks passed!
```

---

## run-tests.sh

**用途**: 运行完整测试套件

**用法**:
```bash
# 测试默认 workspace
./scripts/run-tests.sh

# 测试指定 workspace
./scripts/run-tests.sh /path/to/workspace
```

**测试项**:
- 目录结构测试
- 必需文件测试
- 内容检查测试
- 文件创建测试
- 模板文件检查

**输出示例**:
```
🧪 Running Memory Core Tests...

📁 Test 1: Directory structure...
✅ All directories exist

📄 Test 2: Required files...
✅ MEMORY.md exists
...

🎉 All tests passed!
```

---

## export-to-markdown.sh

**用途**: 导出记忆为 Markdown 格式

**用法**:
```bash
# 导出到默认目录
./scripts/export-to-markdown.sh

# 导出到指定目录
./scripts/export-to-markdown.sh /path/to/export
```

**输出**:
- 创建导出目录
- 复制所有记忆文件
- 生成 README.md 索引

**用途**:
- 备份记忆
- 迁移到其他系统
- 分享记忆

---

## import-from-obsidian.sh

**用途**: 从 Obsidian 导入笔记

**用法**:
```bash
./scripts/import-from-obsidian.sh /path/to/obsidian/vault
```

**导入规则**:
- `YYYY-MM-DD.md` → `memory/`
- `lessons/` → `memory/lessons/`
- `decisions/` → `memory/decisions/`
- `projects/` → `memory/projects/`

**后续步骤**:
1. 运行验证脚本
2. 更新 INDEX.md
3. 检查导入的文件

---

## 脚本使用流程

### 安装时
```bash
# 1. 验证结构
./scripts/verify-memory-structure.sh

# 2. 运行测试
./scripts/run-tests.sh
```

### 日常维护
```bash
# 每小时（cron 自动）
./scripts/heartbeat.sh

# 每天 00:45（cron 自动）
./scripts/nightly-reflection.sh

# 手动记录
./scripts/memlog.sh "标题" "内容"
```

### 备份/迁移
```bash
# 导出
./scripts/export-to-markdown.sh ./backup

# 从 Obsidian 导入
./scripts/import-from-obsidian.sh ~/Obsidian/Vault
```

---

## 故障排查

### 脚本无法执行

```bash
# 添加执行权限
chmod +x scripts/*.sh
```

### 脚本找不到 workspace

```bash
# 设置环境变量
export WORKSPACE=/path/to/workspace
./scripts/verify-memory-structure.sh
```

### 脚本输出乱码

确保使用 UTF-8 编码的终端。