#!/bin/bash
# 博客站点监控脚本
# 每小时运行一次，检查站点可用性

BLOG_URL="https://atomai123.github.io"  # 博客地址
LOG_FILE=~/projects/my-blog/scripts/monitor.log

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 开始监控检查..." >> $LOG_FILE

# 1. 检查首页
HOME_CODE=$(curl -s -o /dev/null -w "%{http_code}" $BLOG_URL)
if [ "$HOME_CODE" = "200" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✅ 首页正常 (HTTP $HOME_CODE)" >> $LOG_FILE
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ❌ 首页异常 (HTTP $HOME_CODE)" >> $LOG_FILE
fi

# 2. 检查随机文章页（示例）
# ARTICLE_CODE=$(curl -s -o /dev/null -w "%{http_code}" $BLOG_URL/articles/sample.html)
# if [ "$ARTICLE_CODE" = "200" ]; then
#     echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✅ 文章页正常" >> $LOG_FILE
# else
#     echo "[$(date '+%Y-%m-%d %H:%M:%S')] ❌ 文章页异常" >> $LOG_FILE
# fi

# 3. 检查响应时间
RESPONSE_TIME=$(curl -s -o /dev/null -w "%{time_total}" $BLOG_URL)
echo "[$(date '+%Y-%m-%d %H:%M:%S')] ⏱️ 响应时间: ${RESPONSE_TIME}s" >> $LOG_FILE

echo "---" >> $LOG_FILE
