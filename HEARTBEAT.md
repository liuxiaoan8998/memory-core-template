# HEARTBEAT.md - 记忆扫描与整理

**频率**：每 60 分钟执行一次  
**目标**：完整性补录 + 知识提取

---

## 🎯 任务清单

使用 memory-heartbeat skill 完成：

1. **扫描所有 session**（按渠道分组，最近60分钟）
2. **用 memlog.sh 记录实质内容** 到 `memory/YYYY-MM-DD.md`
3. **提取决策/洞察/教训** 到对应分类目录
4. **CRUD 验证知识库** 文件
5. **刷新 NOW.md** 当前待办
6. **文件过期标记**（>30天未更新）

---

## 消息清洗规则

**保留：**
- `user` 和 `assistant` 消息
- 关键决策、完成状态、根因分析

**过滤：**
- `HEARTBEAT_OK`、`NO_REPLY`
- 飞书元数据（Queued #、Conversation info）
- 低信号消息（"好的"、"继续"、"谢谢"）
- System prompt、Tool calling 详情

---

## 执行流程

```
收到心跳（60分钟周期）
↓
扫描最近60分钟活跃 sessions
↓
清洗消息 → 提取重要信息（Top 30）
↓
memlog.sh 追加到 memory/YYYY-MM-DD.md
↓
提取知识 → 路由到 lessons/decisions/projects/
↓
更新 INDEX.md 索引
↓
检查文件新鲜度，标记过期
↓
回复执行摘要（静默，NO_REPLY）
```

---

## 如无内容

如果 60 分钟内无实质内容，回复：`HEARTBEAT_OK`