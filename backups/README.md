# OpenClaw 数据备份

## 📦 备份文件

### openclaw-backup-20260210.tar.gz

- **日期**: 2026-02-10
- **大小**: 1.8MB
- **内容**: 完整的OpenClaw配置和工作区

## 🔄 恢复步骤

```bash
# 1. 下载备份
wget https://github.com/atomai123/atomai123.github.io/raw/main/backups/openclaw-backup-20260210.tar.gz

# 2. 停止OpenClaw
openclaw gateway stop

# 3. 解压
cd ~
tar -xzf openclaw-backup-20260210.tar.gz

# 4. 重启
openclaw gateway start
```

## ⚠️ 安全提示

备份包含API密钥，请勿公开分享！
