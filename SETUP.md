# Memory Core 安装配置指南

> ⚠️ **重要**: 本指南适用于**已有 Agent**，指导如何将 Memory Core 集成到现有系统，而非覆盖。

## 前置要求

- OpenClaw 已安装并运行
- 已有 Agent workspace（包含 MEMORY.md、AGENTS.md 等）
- 支持文件系统访问的 Agent 环境

## 安装方式

### 方式1: 全新 Agent（推荐用于测试）

```bash
# 克隆模板到临时目录
git clone https://github.com/liuxiaoan8998/memory-core-template.git /tmp/memory-core

# 复制到新的 workspace（不要覆盖现有）
mkdir -p ~/.openclaw/workspace-new
cp -r /tmp/memory-core/* ~/.openclaw/workspace-new/
```

### 方式2: 集成到现有 Agent（生产环境）

#### 步骤 1: 备份现有文件

```bash
cd ~/.openclaw/workspace

# 备份关键文件
cp MEMORY.md MEMORY.md.backup.$(date +%Y%m%d)
cp AGENTS.md AGENTS.md.backup.$(date +%Y%m%d)
cp HEARTBEAT.md HEARTBEAT.md.backup.$(date +%Y%m%d) 2>/dev/null || echo "HEARTBEAT.md not exists"

# 备份 memory 目录（如果有）
cp -r memory memory.backup.$(date +%Y%m%d) 2>/dev/null || echo "memory/ not exists"
```

#### 步骤 2: 创建记忆目录结构

```bash
# 创建目录（如果不存在）
mkdir -p ~/.openclaw/workspace/memory/{lessons,decisions,projects,preferences,reflections}
```

#### 步骤 3: 合并 MEMORY.md（手动）

**不要直接覆盖！** 手动合并以下内容到现有 `MEMORY.md`：

```markdown
## Memory Core 配置

- **永久记忆触发词**："一直记住"、"永久记忆"、"记住这个"、"别忘了"、"永远记住"

## 关键决策

- 查看 `memory/decisions/` 目录获取完整决策记录
- 查看 `memory/INDEX.md` 获取分类索引

## 经验教训

- 查看 `memory/lessons/` 目录获取可复用经验
- 查看 `memory/INDEX.md` 获取分类索引
```

#### 步骤 4: 创建 memory/NOW.md

```bash
# 创建新的 NOW.md（在 memory/ 目录）
cat > ~/.openclaw/workspace/memory/NOW.md << 'EOF'
# NOW.md - 当前事项

### $(date +%Y-%m-%d) 更新

**当前优先级：**
1. 
2. 
3. 

**近期待办：**
- [ ] 
- [ ] 
- [ ] 
EOF
```

#### 步骤 5: 创建 memory/INDEX.md

```bash
cat > ~/.openclaw/workspace/memory/INDEX.md << 'EOF'
# INDEX.md - 记忆分类索引

*最后更新: $(date +%Y-%m-%d)*

## 健康度概览

- 🔴 重要知识: 0 个 ✅
- ⚠️ 过时 (>30 天): 0 个

**知识库总计: 0 文件**
- lessons:        0 个
- decisions:      0 个
- projects:       0 个
- preferences:    0 个
- reflections:    0 个

---

## 分类索引

### lessons/ - 经验教训
_踩坑 + 解决方法（可复用）_

（暂无）

### decisions/ - 重大决策
_影响后续方向的重要决定_

（暂无）

### projects/ - 项目状态
_正在进行的项目追踪_

（暂无）

### preferences/ - 用户偏好
_用户偏好配置_

（暂无）

### reflections/ - 深度反思
_周期性深度反思记录_

（暂无）

---

## 每日记录

（暂无）
EOF
```

#### 步骤 6: 更新 AGENTS.md（手动合并）

**不要直接覆盖！** 在现有 `AGENTS.md` 末尾添加：

```markdown
## Memory Core 路由规则

新内容产生时，按以下流程判断：

```
新内容产生
↓
是踩坑 + 解决方法吗？（下次能直接用）
├─ 是 → memory/lessons/
└─ 否 → 继续判断
↓
是重大决策吗？（影响后续方向）
├─ 是 → memory/decisions/
└─ 否 → 继续判断
↓
是项目状态变化吗？
├─ 是 → memory/projects/
└─ 否 → 继续判断
↓
是用户偏好吗？
├─ 是 → memory/preferences/
└─ 否 → 继续判断
↓
是日常流水账吗？
├─ 是 → memory/YYYY-MM-DD.md
└─ 否 → 可能是深度反思
```

## 永久记忆触发词

当用户说以下关键词时，立即将相关内容写入长期记忆：

- "一直记住"
- "永久记忆"
- "记住这个"
- "别忘了"
- "永远记住"

**操作**：
1. 识别触发词后的关键信息
2. 立即写入 `MEMORY.md` 或对应分类文件
3. 确认已记录："已永久记忆：xxx"

## 路径简写

AGENTS.md 中使用简写（省略 memory/ 前缀）：
- `decisions/xxx.md` = `memory/decisions/xxx.md`
- `lessons/xxx.md` = `memory/lessons/xxx.md`
- 以此类推
```

#### 步骤 7: 创建 HEARTBEAT.md（如果不存在）

```bash
cat > ~/.openclaw/workspace/HEARTBEAT.md << 'EOF'
# HEARTBEAT.md - 记忆扫描与整理

**频率**：每 60 分钟执行一次  
**目标**：完整性补录 + 知识提取

---

## 🎯 任务清单

1. **扫描所有 session**（最近60分钟）
2. **记录实质内容** 到 `memory/YYYY-MM-DD.md`
3. **提取知识** 到对应分类目录
4. **更新 INDEX.md** 索引
5. **刷新 NOW.md** 当前待办

---

## 消息清洗规则

**保留**：`user` 和 `assistant` 消息、关键决策、完成状态

**过滤**：`HEARTBEAT_OK`、`NO_REPLY`、飞书元数据、低信号消息

---

## 如无内容

如果 60 分钟内无实质内容，回复：`HEARTBEAT_OK`
EOF
```

#### 步骤 8: 配置 OpenClaw Cron（可选）

在 `~/.openclaw/config.yaml` 中添加：

```yaml
cron:
  jobs:
    # 心跳扫描 - 每小时执行
    - name: memory-heartbeat
      schedule: "0 * * * *"
      command: |
        Read HEARTBEAT.md if it exists (workspace context). 
        Follow it strictly. 
        If nothing needs attention, reply HEARTBEAT_OK.
```

## 迁移检查清单

集成完成后，验证以下项目：

- [ ] `memory/` 目录已创建
- [ ] `memory/NOW.md` 存在
- [ ] `memory/INDEX.md` 存在
- [ ] `MEMORY.md` 已更新（包含 Memory Core 配置）
- [ ] `AGENTS.md` 已更新（包含路由规则）
- [ ] `HEARTBEAT.md` 存在
- [ ] 原有文件已备份
- [ ] 测试"记住这个"触发词

## 故障排查

### 问题: 原有记忆丢失

**解决**: 从备份恢复
```bash
cd ~/.openclaw/workspace
cp MEMORY.md.backup.20260403 MEMORY.md
cp -r memory.backup.20260403 memory
```

### 问题: 记忆没有记录到正确位置

**检查**: 
- `AGENTS.md` 是否包含路由规则
- 触发词是否正确（"记住这个"/"一直记住"）

### 问题: NOW.md 路径错误

**注意**: `NOW.md` 必须在 `memory/` 目录，不是根目录

## 下一步

- 阅读 [USAGE.md](USAGE.md) 了解日常使用
- 阅读 [ARCHITECTURE.md](ARCHITECTURE.md) 理解系统设计
- 测试记忆功能：说"记住这个：测试"，检查是否正确记录

---

**重要提醒**: 本指南强调**手动合并**而非直接覆盖，以保护现有 Agent 的配置和数据。