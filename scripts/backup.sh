#!/bin/bash
# 博客自动备份脚本
# 每天凌晨2点运行，保留最近30天的备份

DATE=$(date +%Y%m%d)
BACKUP_DIR=~/projects/my-blog/backup
SOURCE_DIR=~/projects/my-blog
LOG_FILE=~/projects/my-blog/backup/backup.log

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 开始备份..." >> $LOG_FILE

# 打包文章、图片和配置
tar -czf $BACKUP_DIR/blog-backup-$DATE.tar.gz \
  $SOURCE_DIR/articles \
  $SOURCE_DIR/images \
  $SOURCE_DIR/content \
  $SOURCE_DIR/layouts \
  $SOURCE_DIR/static \
  $SOURCE_DIR/hugo.toml \
  $SOURCE_DIR/scripts 2>> $LOG_FILE

if [ $? -eq 0 ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 备份成功: blog-backup-$DATE.tar.gz" >> $LOG_FILE
    
    # 保留最近30天的备份
    find $BACKUP_DIR -name "blog-backup-*.tar.gz" -mtime +30 -delete
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 已清理30天前的旧备份" >> $LOG_FILE
else
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 备份失败！" >> $LOG_FILE
    exit 1
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 备份完成" >> $LOG_FILE
echo "---" >> $LOG_FILE
