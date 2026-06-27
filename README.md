# Ask Five · 叫五个人来帮忙

**版本：v1.1.3**

把 25 个名人/主题 skill 打包成一个可路由的顾问团。

面对复杂决策或重要议题时，说一句「Ask Five」，让合适的专家自动出场，依次发言，最后给出综合建议。

## 标准 Skill 包

本仓库是一个**标准的多文件 skill 包**，目录结构通用于支持 SKILL.md 的 AI Agent 平台：

```
ask-five-skill/
├── SKILL.md              # skill 主入口
├── references/           # 专家子 skill、模板、示例
├── scripts/              # 辅助脚本
└── manifest.json         # 跨平台元数据
```

## 平台安装

| 平台 | 安装位置 | 安装方式 |
|---|---|---|
| **HanaAgent** | `~/.hanako/skills/ask-five-skill/` | `install_skill github_url=https://github.com/nico-zhuang/ask-five-skill` |
| **Claude Code** | `~/.claude/skills/ask-five-skill/` 或 `.claude/skills/ask-five-skill/` | 克隆/复制本仓库到对应目录 |
| **Codex** | `~/.codex/skills/ask-five-skill/` | 克隆/复制本仓库到对应目录 |
| **腾讯 SkillHub** | 平台托管 | 上传本仓库 ZIP 包 |

### HanaAgent

```
install_skill github_url=https://github.com/nico-zhuang/ask-five-skill reason='安装 Ask Five 专家团 skill'
```

安装后需在 HanaAgent 设置中手动启用 `ask-five-skill`（`default-enabled: false`）。

### Claude Code

```bash
# 个人全局安装
git clone https://github.com/nico-zhuang/ask-five-skill.git ~/.claude/skills/ask-five-skill

# 或项目级安装
git clone https://github.com/nico-zhuang/ask-five-skill.git .claude/skills/ask-five-skill
```

然后在 Claude Code 中输入 `/ask-five-skill` 或说出触发词。

### Codex

```bash
git clone https://github.com/nico-zhuang/ask-five-skill.git ~/.codex/skills/ask-five-skill
```

### 腾讯 SkillHub

下载本仓库 ZIP，上传到 SkillHub 发布页。

## 触发词

- 「Ask Five」「ask five」
- 「专家团开会」「召集专家团」「叫专家团」
- 「panel」「expert panel」
- 「大事商量」「帮我组个局」

## 机制

1. 听懂议题类型
2. 默认从 24 位专家中选 3-5 位视角互补的代表（严禁超过 5 人）
3. 依次用各专家视角发言
4. 输出共识、分歧、盲区、综合建议
5. 根据议题类型主动推荐产出物（决策卡、行动清单、风险检查清单等）

## 24 位专家

完整名单见 `references/experts/`。

## 跨平台说明

本 skill 的核心机制是**多文件动态路由**：

- `SKILL.md` 作为主持人/秘书处
- `references/experts/` 下的 24 个子 skill 作为专家库
- 主持人根据议题选择 3-5 位专家，依次调用其子 skill

任何支持多文件 skill 的 Agent 平台（HanaAgent、Claude Code、Codex、腾讯 SkillHub）都可以保持这个智能路由效果，只需要把本仓库放到该平台对应的 skills 目录即可。

## 注意事项

- 默认不自动启用，需要在所在 agent 的设置中手动启用
- 每次会议最多 5 人，避免信息过载
- 不同领域代表人物（张雪峰等）仅作为分析工具，不替代价值观判断

## 更新日志

### v1.1.3（2026-06-27）

- SkillHub 合规分支：移除特朗普视角，调整鲁迅/张雪峰描述
- 将"政治站队"等敏感表述改为"高风险决策"
- 专家数量从 25 位调整为 24 位

### v1.1.2（2026-06-27）

- 统一三平台发布：GitHub、极境能力库、腾讯 SkillHub
- SKILL.md 新增 `slug`、`displayName`、`license` 字段，兼容 SkillHub 发布规范
- 三平台 slug 统一为 `ask-five-skill`

### v1.1.1（2026-06-26）

- 标准 skill 包发布
- 支持 HanaAgent、Claude Code、Codex、腾讯 SkillHub 多平台
- 24 位专家顾问团
