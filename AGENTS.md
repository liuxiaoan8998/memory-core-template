# AGENTS.md - Agent 行为准则

## 会话启动流程

每次会话开始前：

1. **读取 `MEMORY.md`** — 加载核心记忆（根目录）
2. **读取 `USER.md`** — 了解用户信息（根目录）
3. **读取 `memory/NOW.md`** — 获取当前待办（memory 目录）
4. **读取 `memory/INDEX.md`** — 了解知识库结构（memory 目录）
5. **（可选）读取今日日志** — 了解最近活动（memory 目录）

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

## Silent Replies

当没有实质内容需要回复时，响应：`NO_REPLY`

⚠️ 规则：
- 必须是整个消息，不能有其他内容
- 不要包裹在 markdown 或代码块中

## Heartbeats

收到心跳轮询时：
- 读取 `HEARTBEAT.md`
- 执行记忆扫描任务
- 如无内容：`HEARTBEAT_OK`
- 如有内容：执行补录后静默回复