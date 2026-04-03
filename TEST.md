# Memory Core 测试用例

## 测试环境准备

```bash
# 1. 克隆模板
git clone https://github.com/liuxiaoan8998/memory-core-template.git
cd memory-core-template

# 2. 运行验证脚本
./scripts/verify-memory-structure.sh

# 3. 验证通过后再进行测试
```

---

## 测试1: 文件结构测试

### 测试1.1: 目录结构完整性

**目的**: 验证所有必需目录存在

**步骤**:
```bash
ls -la memory/
ls -la memory/lessons/
ls -la memory/decisions/
ls -la memory/projects/
ls -la memory/preferences/
ls -la memory/reflections/
```

**预期结果**:
- ✅ memory/ 目录存在
- ✅ lessons/ 目录存在
- ✅ decisions/ 目录存在
- ✅ projects/ 目录存在
- ✅ preferences/ 目录存在
- ✅ reflections/ 目录存在

---

### 测试1.2: 必需文件存在性

**目的**: 验证所有必需文件存在

**步骤**:
```bash
test -f MEMORY.md && echo "✅ MEMORY.md exists"
test -f AGENTS.md && echo "✅ AGENTS.md exists"
test -f HEARTBEAT.md && echo "✅ HEARTBEAT.md exists"
test -f memory/NOW.md && echo "✅ memory/NOW.md exists"
test -f memory/INDEX.md && echo "✅ memory/INDEX.md exists"
```

**预期结果**: 所有文件都存在

---

## 测试2: 内容格式测试

### 测试2.1: MEMORY.md 内容检查

**目的**: 验证 MEMORY.md 包含关键配置

**步骤**:
```bash
grep -q "永久记忆触发词" MEMORY.md && echo "✅ 触发词配置存在"
grep -q "memory/decisions/" MEMORY.md && echo "✅ decisions 路径存在"
grep -q "memory/lessons/" MEMORY.md && echo "✅ lessons 路径存在"
```

**预期结果**: 所有关键配置都存在

---

### 测试2.2: AGENTS.md 路由规则检查

**目的**: 验证 AGENTS.md 包含记忆路由规则

**步骤**:
```bash
grep -q "lessons/" AGENTS.md && echo "✅ lessons 路由存在"
grep -q "decisions/" AGENTS.md && echo "✅ decisions 路由存在"
grep -q "projects/" AGENTS.md && echo "✅ projects 路由存在"
```

**预期结果**: 所有路由规则都存在

---

## 测试3: 文件读写测试

### 测试3.1: 创建每日日志

**目的**: 验证每日日志创建功能

**步骤**:
```bash
# 创建今日日志
cat > memory/2026-04-03.md << 'EOF'
# 2026-04-03 记忆日志

### 10:00 — 测试会话
这是测试内容。

**关键决策**：
- 决策1

**提取的知识**：
- 需要记录到 lessons/
EOF

# 验证文件创建
ls -la memory/2026-04-03.md
cat memory/2026-04-03.md
```

**预期结果**:
- 文件创建成功
- 内容格式正确

---

### 测试3.2: 创建教训文件

**目的**: 验证 lessons/ 文件创建

**步骤**:
```bash
# 创建教训文件
cat > memory/lessons/test-lesson.md << 'EOF'
# 教训：测试教训

**记录时间**: 2026-04-03
**状态**: ✅ 已验证

## 问题描述
测试问题描述。

## 解决方法
测试解决方法。

## 关键教训
> 测试教训总结
EOF

# 验证
ls -la memory/lessons/test-lesson.md
cat memory/lessons/test-lesson.md
```

**预期结果**:
- 文件创建成功
- 格式符合模板

---

### 测试3.3: 更新 INDEX.md

**目的**: 验证 INDEX.md 更新

**步骤**:
```bash
# 更新 INDEX.md
cat > memory/INDEX.md << 'EOF'
# INDEX.md - 记忆分类索引

*最后更新: 2026-04-03*

## 健康度概览

- 🔴 重要知识: 1 个 ✅
- ⚠️ 过时 (>30 天): 0 个

**知识库总计: 1 文件**
- lessons:        1 个
- decisions:      0 个
- projects:       0 个
- preferences:    0 个
- reflections:    0 个

## 分类索引

### lessons/ - 经验教训
- [test-lesson.md](./lessons/test-lesson.md) - 测试教训
EOF

# 验证
cat memory/INDEX.md
```

**预期结果**:
- INDEX.md 更新成功
- 统计信息正确

---

## 测试4: 触发词测试

### 测试4.1: 模拟"记住这个"触发

**目的**: 验证触发词机制

**步骤**:
1. 用户说："记住这个：测试触发词"
2. Agent 应该：
   - 检测到触发词"记住这个"
   - 提取内容"测试触发词"
   - 写入 appropriate 文件

**预期结果**:
- Agent 正确识别触发词
- 内容被记录到正确位置

---

## 测试5: 集成测试

### 测试5.1: 完整流程测试

**目的**: 验证完整记忆流程

**场景**: 模拟一次完整会话

**步骤**:
1. 会话开始
2. Agent 读取 MEMORY.md
3. Agent 读取 memory/NOW.md
4. 用户说"记住这个：重要信息"
5. Agent 记录到 appropriate 文件
6. 会话结束

**验证**:
```bash
# 检查每日日志是否创建
ls memory/2026-04-*.md

# 检查 INDEX.md 是否更新
grep -q "重要信息" memory/INDEX.md && echo "✅ INDEX 已更新"
```

**预期结果**:
- 每日日志创建
- INDEX.md 更新
- 内容正确记录

---

## 测试6: 升级兼容性测试

### 测试6.1: 现有 Agent 升级测试

**目的**: 验证现有 Agent 可以安全升级

**前提**: 已有 Agent workspace

**步骤**:
1. 备份现有文件
2. 按照 SETUP.md 升级指南操作
3. 运行验证脚本
4. 测试现有功能

**预期结果**:
- 升级成功
- 现有功能不受影响
- 新功能正常工作

---

## 自动化测试脚本

创建 `scripts/run-tests.sh`:

```bash
#!/bin/bash
# Memory Core Test Suite

echo "🧪 Running Memory Core Tests..."

ERRORS=0

# Test 1: Structure
echo "📁 Testing directory structure..."
./scripts/verify-memory-structure.sh || ERRORS=$((ERRORS + 1))

# Test 2: Content
echo "📝 Testing file content..."
grep -q "永久记忆触发词" MEMORY.md || { echo "❌ MEMORY.md missing trigger words"; ERRORS=$((ERRORS + 1)); }
grep -q "lessons/" AGENTS.md || { echo "❌ AGENTS.md missing lessons route"; ERRORS=$((ERRORS + 1)); }

# Test 3: File creation
echo "🆕 Testing file creation..."
echo "test" > memory/test-file.md && rm memory/test-file.md || { echo "❌ Cannot create files in memory/"; ERRORS=$((ERRORS + 1)); }

# Summary
if [ $ERRORS -eq 0 ]; then
    echo "🎉 All tests passed!"
    exit 0
else
    echo "⚠️  $ERRORS test(s) failed"
    exit 1
fi
```

---

## 故障排查

### 问题: 测试失败

**检查**:
1. 是否按照 SETUP.md 正确安装
2. 是否运行了验证脚本
3. 文件权限是否正确

### 问题: 文件无法创建

**检查**:
```bash
ls -ld memory/
# 确保有写权限
```

### 问题: 内容格式错误

**检查**:
- 参考 example-*.md 模板
- 确保使用正确的 Markdown 格式

---

## 持续集成

在 `.github/workflows/ci.yml` 中添加测试步骤:

```yaml
    - name: Run Tests
      run: |
        ./scripts/verify-memory-structure.sh
        ./scripts/run-tests.sh
```