# Memory Core 安装配置指南

## 前置要求

- OpenClaw 已安装并运行
- 支持文件系统访问的 Agent 环境
- （可选）飞书/日历等集成权限

## 安装步骤

### 步骤 1: 复制模板文件

```bash
# 方法 1: 直接复制到 workspace
cp -r memory-core-template/* ~/.openclaw/workspace/

# 方法 2: 作为子目录（推荐用于多项目）
mkdir -p ~/.openclaw/workspace/projects/memory-core
cp -r memory-core-template/* ~/.openclaw/workspace/projects/memory-core/
```

### 步骤 2: 初始化核心文件

复制以下文件到 workspace：

```bash
# 根目录文件
cp memory-core-template/MEMORY.md ~/.openclaw/workspace/
cp memory-core-template/HEARTBEAT.md ~/.openclaw/workspace/
cp memory-core-template/AGENTS.md ~/.openclaw/workspace/

# memory 目录文件
cp memory-core-template/memory/NOW.md ~/.openclaw/workspace/memory/
cp memory-core-template/memory/INDEX.md ~/.openclaw/workspace/memory/
```

### 步骤 3: 创建记忆目录结构

```bash
mkdir -p ~/.openclaw/workspace/memory/{lessons,decisions,projects,preferences,reflections}
```

### 步骤 4: 配置 OpenClaw Cron 任务

在 `~/.openclaw/config.yaml` 中添加：

```yaml
cron:
  jobs:
    # 心跳扫描 - 每小时执行
    - name: memory-heartbeat
      schedule: "0 * * * *"
      command: |
        Read HEARTBEAT.md if it exists (workspace context). 
        Follow it strictly. Do not infer or repeat old tasks from prior chats. 
        If nothing needs attention, reply HEARTBEAT_OK.
      
    # 夜间反思素材生成 - 每天 00:45
    - name: nightly-reflection-prep
      schedule: "45 0 * * *"
      command: |
        执行 memory-prep skill：
        1. 扫描过去24小时的会话
        2. 提取关键决策、洞察、教训
        3. 生成反思素材到 memory/YYYY-MM-DD-reflection-prep.md
      
    # 深度反思 - 每天 01:00
    - name: deep-reflection
      schedule: "0 1 * * *"
      command: |
        读取今日反思素材，执行深度反思：
        1. 分析今日核心主题
        2. 提取深度洞察
        3. 识别可复用的方法论
        4. 生成明日行动清单
        5. 提取知识到 lessons/ 或 decisions/
```

### 步骤 5: 配置 Agent 行为

编辑 `AGENTS.md`，添加记忆路由规则：

```markdown
## 记忆文件路由规则

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

## 启动验证

### 测试 1: 心跳扫描

等待整点或手动触发：

```
Read HEARTBEAT.md if it exists (workspace context). 
Follow it strictly.
```

预期输出：`HEARTBEAT_OK` 或执行摘要

### 测试 2: 创建第一条记忆

在对话中测试：

```
用户: 记住这个：测试记忆系统
Agent: [应该触发永久记忆，写入 MEMORY.md 或 lessons/]
```

### 测试 3: 检查文件生成

```bash
ls -la ~/.openclaw/workspace/memory/
# 应该看到目录结构和生成的文件
```

## 故障排查

### 问题: 心跳扫描不执行

**检查**: 
- OpenClaw gateway 是否运行: `openclaw gateway status`
- Cron 配置是否正确加载
- 日志是否有错误: `openclaw logs`

### 问题: 记忆文件未生成

**检查**:
- 目录权限是否正确
- Agent 是否有文件系统访问权限
- 触发词是否匹配（"一直记住"/"永久记忆"/"记住这个"）

### 问题: 知识提取不准确

**调整**:
- 修改 AGENTS.md 中的路由规则
- 调整反思提示词，明确提取标准
- 手动修正分类，建立示例

## 下一步

- 阅读 [USAGE.md](USAGE.md) 了解日常使用
- 阅读 [ARCHITECTURE.md](ARCHITECTURE.md) 理解系统设计
- 阅读 [CUSTOMIZATION.md](CUSTOMIZATION.md) 进行个性化配置