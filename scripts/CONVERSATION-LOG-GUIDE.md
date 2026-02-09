# OpenClaw 对话记录定时任务

## 任务说明

**目的**: 每小时自动记录对话历史到日志文件

**运行频率**: 每小时（静默后台运行）

**日志位置**: ~/projects/my-blog/conversation-logs/

---

## 脚本位置

`~/projects/my-blog/scripts/log-conversations.sh`

---

## 添加到定时任务

### 方法1：使用crontab（推荐）

```bash
# 编辑crontab
crontab -e

# 添加以下行（每小时运行）
0 * * * * /root/projects/my-blog/scripts/log-conversations.sh >> /root/projects/my-blog/scripts/conversation-cron.log 2>&1
```

### 方法2：使用OpenClaw的cron系统

使用OpenClaw的cron命令添加：
```bash
openclaw cron add --job '{
  "name": "记录对话",
  "schedule": {
    "kind": "cron",
    "expr": "0 * * * *"
  },
  "payload": {
    "kind": "systemEvent",
    "text": "运行对话记录脚本: /root/projects/my-blog/scripts/log-conversations.sh"
  },
  "sessionTarget": "main"
}'
```

---

## 日志格式

### 日志文件命名

`~/projects/my-blog/conversation-logs/2026-02-10.md`

### 日志内容格式

```markdown
# 对话记录 - 2026-02-10

**日期**: 2026-02-10
**记录时间**: 每小时

---

## 🕐 02:00

对话记录已更新

---

## 🕐 03:00

对话记录已更新

---
```

---

## 高级功能（可选）

### 集成OpenClaw会话历史

如果OpenClaw提供了会话历史API，可以修改脚本获取实际对话内容：

```bash
# 获取今天的会话历史
SESSIONS=$(openclaw sessions list --today)

# 写入日志
echo "$SESSIONS" >> "$LOG_FILE"
```

### 自动备份对话到博客

可以将对话记录自动发布为博客文章：

```bash
# 每天23:59生成一天的对话总结文章
59 23 * * * /root/projects/my-blog/scripts/generate-daily-post.sh
```

---

## 监控脚本运行

### 查看日志

```bash
# 查看脚本运行日志
tail -f /root/projects/my-blog/scripts/conversation-cron.log

# 查看最新的对话记录
ls -lht ~/projects/my-blog/conversation-logs/ | head -5
```

### 检查脚本是否运行

```bash
# 查看crontab
crontab -l | grep log-conversations

# 查看OpenClaw cron任务
openclaw cron list
```

---

## 静默后台运行

脚本已经设计为静默运行：
- ✅ 无交互式输出
- ✅ 仅写入日志文件
- ✅ 不干扰正常工作

---

## 测试脚本

### 手动运行测试

```bash
# 运行一次看看效果
/root/projects/my-blog/scripts/log-conversations.sh

# 查看生成的日志
cat ~/projects/my-blog/conversation-logs/$(date +%Y-%m-%d).md
```

---

## 故障排查

### 脚本没有运行

1. 检查crontab：`crontab -l`
2. 检查脚本权限：`ls -lh ~/projects/my-blog/scripts/log-conversations.sh`
3. 查看日志：`tail ~/projects/my-blog/scripts/conversation-cron.log`

### 日志文件没有生成

1. 检查目录权限：`ls -ld ~/projects/my-blog/conversation-logs/`
2. 手动运行测试：`/root/projects/my-blog/scripts/log-conversations.sh`

---

## 后续优化建议

1. **内容提取** - 集成OpenClaw API获取实际对话内容
2. **智能总结** - 使用AI总结每天的对话要点
3. **自动发布** - 重要对话自动生成博客文章
4. **标签分类** - 按主题自动分类对话内容
5. **搜索索引** - 建立对话搜索索引

---

**创建时间**: 2026-02-10
**脚本版本**: v1.0
