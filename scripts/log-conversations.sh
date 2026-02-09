#!/bin/bash
# OpenClaw 对话记录脚本
# 每小时运行一次，记录当天对话

LOG_DIR=~/projects/my-blog/conversation-logs
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)
LOG_FILE="$LOG_DIR/$DATE.md"

# 创建日志目录
mkdir -p "$LOG_DIR"

# 如果是第一次运行，创建文件头
if [ ! -f "$LOG_FILE" ]; then
    cat > "$LOG_FILE" << EOF
# 对话记录 - $DATE

**日期**: $DATE
**记录时间**: 每小时

---

EOF
fi

# 添加时间戳
echo "## 🕐 $TIME" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# 获取对话历史（如果有API）
# 这里需要根据实际的OpenClaw API或日志文件来获取

# 备注：目前使用手动标记方式
echo "对话记录已更新" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
echo "---" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 对话记录已更新: $LOG_FILE"
