#!/bin/bash
# Ask Five · 专家 skill 可用性扫描脚本
# 输出 JSON：{"installed": [...], "simulated": [...]}
# 支持 HanaAgent (~/.hanako/skills) 和 Codex (~/.codex/skills)

# 默认 Ask Five 目录：优先使用脚本所在位置，其次尝试常见 runtime 路径
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/../SKILL.md" ]; then
  DEFAULT_ASK_FIVE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
elif [ -d "$HOME/.hanako/skills/ask-five-skill" ]; then
  DEFAULT_ASK_FIVE_DIR="$HOME/.hanako/skills/ask-five-skill"
elif [ -d "$HOME/.codex/skills/ask-five-skill" ]; then
  DEFAULT_ASK_FIVE_DIR="$HOME/.codex/skills/ask-five-skill"
else
  DEFAULT_ASK_FIVE_DIR="$HOME/.hanako/skills/ask-five-skill"
fi

ASK_FIVE_DIR="${1:-$DEFAULT_ASK_FIVE_DIR}"
BUNDLED_DIR="$ASK_FIVE_DIR/references/experts"

# 系统 skill 目录：从 Ask Five 安装位置推导，或环境变量覆盖
if [ -n "$ASK_FIVE_SKILLS_DIR" ]; then
  SYSTEM_SKILLS_DIR="$ASK_FIVE_SKILLS_DIR"
else
  SYSTEM_SKILLS_DIR="$(dirname "$ASK_FIVE_DIR")"
fi

EXPERTS=(
  "steve-jobs-perspective"
  "elon-musk-perspective"
  "munger-perspective"
  "trump-perspective"
  "andrej-karpathy-perspective"
  "feynman-perspective"
  "naval-perspective"
  "zhang-yiming-perspective"
  "taleb-perspective"
  "mrbeast-perspective"
  "paul-graham-perspective"
  "ilya-sutskever-perspective"
  "zhangxuefeng-perspective"
  "x-mastery-mentor"
  "freud-skill"
  "huashu-nuwa"
  "darwin-skill"
  "huashu-agent-swarm"
  "buffett-perspective"
  "rob-pike-skill"
  "luxun-skill"
  "guodegang-skills"
  "qiushi-skill"
  "ogilvy-social-listening"
  "gwtb-brand-strategy"
)

installed=()
simulated=()

for expert in "${EXPERTS[@]}"; do
  if [ -d "$BUNDLED_DIR/$expert" ] || [ -d "$SYSTEM_SKILLS_DIR/$expert" ]; then
    installed+=("$expert")
  else
    simulated+=("$expert")
  fi
done

printf '{"installed":['
first=1
for e in "${installed[@]}"; do
  if [ $first -eq 1 ]; then first=0; else printf ','; fi
  printf '"%s"' "$e"
done
printf '],"simulated":['
first=1
for e in "${simulated[@]}"; do
  if [ $first -eq 1 ]; then first=0; else printf ','; fi
  printf '"%s"' "$e"
done
printf ']}\n'
