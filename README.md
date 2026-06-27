# Ask Five · 叫五个人来帮忙

**版本：v1.1.1**

把 25 个名人/主题 skill 打包成一个可路由的顾问团。

面对复杂决策或重要议题时，说一句「Ask Five」，让合适的专家自动出场，依次发言，最后给出综合建议。

## 多平台支持

本仓库提供以下平台的适配版本：

| 平台 | 入口 | 安装方式 | 路由方式 |
|---|---|---|---|
| **HanaAgent** | 仓库根目录 `SKILL.md` | `install_skill github_url=https://github.com/nico-zhuang/ask-five-skill` | 多文件动态路由 |
| **腾讯 SkillHub** | 仓库根目录 ZIP | 下载仓库 ZIP 上传到 SkillHub | 多文件动态路由 |
| **Codex** | `platforms/codex/ask-five-skill.md` | 复制到 `~/.codex/skills/ask-five-skill.md` | 单文件规则路由 |
| **Claude Code** | `platforms/claude-code/ask-five/ask-five.md` | 复制到项目 `.claude/ask-five/` | 多文件动态路由 |

## 快速安装

### HanaAgent

```
install_skill github_url=https://github.com/nico-zhuang/ask-five-skill reason='安装 Ask Five 专家团 skill'
```

安装后需在 HanaAgent 设置中手动启用 `ask-five-skill`（`default-enabled: false`）。

### Codex

```bash
cp platforms/codex/ask-five-skill.md ~/.codex/skills/ask-five-skill.md
```

### Claude Code

```bash
mkdir -p .claude/ask-five
cp -R platforms/claude-code/ask-five/* .claude/ask-five/
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
2. 默认从 25 位专家中选 3-5 位视角互补的代表（严禁超过 5 人）
3. 依次用各专家视角发言
4. 输出共识、分歧、盲区、综合建议
5. 根据议题类型主动推荐产出物（决策卡、行动清单、风险检查清单等）

## 25 位专家

完整名单见 `references/experts/`（HanaAgent）或 `platforms/claude-code/ask-five/experts/`（Claude Code）。

## 注意事项

- 默认不自动启用，需要在所在 agent 的设置中手动启用
- 每次会议最多 5 人，避免信息过载
- 敏感人物（特朗普、张雪峰等）仅作为分析工具，不替代价值观判断

## 跨平台差异

- **HanaAgent / SkillHub / Claude Code**：支持多文件结构，可保持完整的动态路由效果
- **Codex**：受限于单文件 skill 格式，采用规则路由 + 内嵌专家画像的方式，效果接近但实现机制不同

## 更新日志

### v1.1.1（2026-06-26）

- 初始多平台版本发布
- 支持 HanaAgent、Codex、Claude Code、腾讯 SkillHub
- 25 位专家顾问团
