# Memory Core - Agent 记忆系统模板

> 拯救龙虾记忆 —— 让 AI Agent 拥有真正的长期记忆能力

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![OpenClaw](https://img.shields.io/badge/Built%20for-OpenClaw-blue.svg)](https://openclaw.ai)

## 快速开始

```bash
# 1. 克隆模板
git clone https://github.com/yourusername/memory-core-template.git

# 2. 按照 SETUP.md 完成配置（重要：不要直接覆盖！）
# 详细步骤见 SETUP.md

# 3. 运行测试验证安装
./scripts/verify-memory-structure.sh
./scripts/run-tests.sh
```

## 核心特性

| 特性 | 说明 |
|-----|------|
| 🧠 **分层记忆** | 核心记忆 + 每日日志 + 分类知识库 |
| ⚡ **自动捕获** | 心跳扫描 + 夜间反思 + 索引维护 |
| 🔍 **智能检索** | 上下文感知 + 主动推送 + 模式识别 |
| 📊 **健康监控** | 活跃度指标 + 知识增长追踪 |

## 系统架构

```
memory-core/
├── MEMORY.md                 # 核心记忆（精简 <5KB）
├── NOW.md                    # 当前待办
├── HEARTBEAT.md              # 心跳扫描配置
├── AGENTS.md                 # Agent 行为准则
├── memory/
│   ├── INDEX.md              # 知识库索引
│   ├── YYYY-MM-DD.md         # 每日日志
│   ├── lessons/              # 经验教训
│   ├── decisions/            # 重大决策
│   ├── projects/             # 项目状态
│   ├── preferences/          # 用户偏好
│   └── reflections/          # 深度反思
└── scripts/
    ├── heartbeat.sh          # 心跳扫描脚本
    ├── nightly-reflection.sh # 夜间反思脚本
    └── memlog.sh             # 日志记录工具
```

## 文档导航

- [SETUP.md](SETUP.md) - 安装和配置指南
- [ARCHITECTURE.md](ARCHITECTURE.md) - 系统架构详解
- [USAGE.md](USAGE.md) - 使用手册
- [TEST.md](TEST.md) - 测试用例和验证指南
- [CUSTOMIZATION.md](CUSTOMIZATION.md) - 自定义指南（可选）
- [FAQ.md](FAQ.md) - 常见问题（可选）

## 适用场景

- 🤖 **AI Agent** - 为 OpenClaw 等 Agent 框架提供记忆能力
- 📝 **个人助理** - 长期陪伴型 AI 的记忆基础设施
- 🏢 **团队协作** - 多 Agent 共享知识库
- 🔬 **研究项目** - 实验记录和知识沉淀

## 版本历史

| 版本 | 日期 | 说明 |
|-----|------|------|
| v1.0.0 | 2026-04-03 | 初始版本，7天实战验证 |

## 贡献指南

欢迎提交 Issue 和 PR！详见 [CONTRIBUTING.md](CONTRIBUTING.md)

## 许可证

MIT License - 详见 [LICENSE](LICENSE)

---

**致谢**: 本系统灵感来自文章《拯救龙虾记忆》，感谢原作者的启发。