# 📋 OpenClaw 完整数据备份清单

## 🎯 重装OpenClaw前必须备份的数据

### ⚠️ 最高优先级（必须备份）

#### 1. 主配置文件
```bash
~/.openclaw/openclaw.json          # 主配置（API密钥、模型设置等）
~/.openclaw/openclaw.json.bak      # 配置备份
```

**包含**：
- API密钥
- 模型配置
- 渠道设置
- 所有重要配置

---

#### 2. 工作区数据（最重要！）
```bash
~/.openclaw/workspace/             # 工作区（664KB）
```

**重要内容**：
```
~/.openclaw/workspace/
├── AGENTS.md                      # Agent配置
├── SOUL.md                        # AI人格
├── USER.md                        # 用户信息
├── TOOLS.md                       # 工具笔记
├── MEMORY.md                      # 长期记忆
├── HEARTBEAT.md                   # 心跳检查
├── memory/                        # 每日记忆
│   ├── 2026-02-08.md
│   ├── 2026-02-09.md
│   ├── 2026-02-10.md
│   └── heartbeat-state.json
├── projects/                      # 项目
│   └── my-blog/                   # 博客项目
└── skills/                        # 自定义技能
```

---

#### 3. Agent会话数据
```bash
~/.openclaw/agents/                # Agent配置（3.1MB）
```

---

#### 4. 定时任务
```bash
~/.openclaw/cron/                  # 定时任务配置（56KB）
```

**包含**：
- 所有定时任务配置
- 任务状态

---

#### 5. 媒体文件
```bash
~/.openclaw/media/                 # 媒体文件（1.4MB）
```

---

#### 6. 扩展和技能
```bash
~/.openclaw/extensions/            # 扩展（3.4GB，最大）
~/.openclaw/workspace/skills/     # 自定义技能
```

**注意**：extensions目录很大（3.4GB），主要是node_modules

---

### 🔧 中等优先级（建议备份）

#### 7. 设备配对
```bash
~/.openclaw/devices/               # 设备配对信息（8KB）
```

#### 8. 身份配置
```bash
~/.openclaw/identity/              # 身份配置（8KB）
```

---

### 📦 完整备份脚本

#### 方法1：一键备份所有重要数据

```bash
#!/bin/bash
# 创建备份目录
BACKUP_DIR=~/openclaw-backup-$(date +%Y%m%d)
mkdir -p $BACKUP_DIR

# 1. 配置文件
cp -r ~/.openclaw/openclaw.json* $BACKUP_DIR/

# 2. 工作区（最重要）
cp -r ~/.openclaw/workspace $BACKUP_DIR/

# 3. Agent配置
cp -r ~/.openclaw/agents $BACKUP_DIR/

# 4. 定时任务
cp -r ~/.openclaw/cron $BACKUP_DIR/

# 5. 媒体文件
cp -r ~/.openclaw/media $BACKUP_DIR/

# 6. 设备和身份
cp -r ~/.openclaw/devices $BACKUP_DIR/
cp -r ~/.openclaw/identity $BACKUP_DIR/

# 7. 技能（自定义）
cp -r ~/.openclaw/workspace/skills $BACKUP_DIR/

echo "备份完成：$BACKUP_DIR"
du -sh $BACKUP_DIR
```

**运行**：
```bash
bash ~/backup-openclaw.sh
```

---

#### 方法2：仅备份核心数据（最小）

```bash
#!/bin/bash
BACKUP_DIR=~/openclaw-minimal-backup-$(date +%Y%m%d)
mkdir -p $BACKUP_DIR

# 仅备份核心配置和工作区
cp ~/.openclaw/openclaw.json $BACKUP_DIR/
cp -r ~/.openclaw/workspace $BACKUP_DIR/
cp -r ~/.openclaw/cron $BACKUP_DIR/

echo "最小备份完成：$BACKUP_DIR"
```

---

### 📊 备份大小估算

| 备份类型 | 大小 | 说明 |
|---------|------|------|
| 最小备份（仅核心） | ~5MB | 配置 + 工作区 |
| 标准备份 | ~10MB | 核心数据全部 |
| 完整备份 | ~3.5GB | 包含extensions |

**建议**：标准备份即可，extensions重装时会自动下载

---

### 🔄 重装后恢复步骤

#### 1. 安装OpenClaw
```bash
npm install -g openclaw@latest
```

#### 2. 恢复配置
```bash
# 停止OpenClaw
openclaw gateway stop

# 恢复配置文件
cp ~/openclaw-backup-20260210/openclaw.json ~/.openclaw/

# 恢复工作区
cp -r ~/openclaw-backup-20260210/workspace/* ~/.openclaw/workspace/

# 恢复定时任务
cp -r ~/openclaw-backup-20260210/cron/* ~/.openclaw/cron/

# 重启OpenClaw
openclaw gateway start
```

---

### 💡 最佳实践

#### 备份频率
- **配置文件**：每次修改后
- **工作区**：每周一次
- **定时任务**：添加新任务后

#### 备份位置
- **本地**：~/backups/
- **云端**：GitHub私有仓库
- **云存储**：百度网盘/Google Drive

#### 自动化备份

添加到定时任务：
```bash
# 每周日凌晨3点自动备份
0 3 * * 0 ~/backup-openclaw.sh
```

---

### ⚠️ 注意事项

1. **API密钥安全**：openclaw.json包含API密钥，备份时注意加密
2. **工作区最重要**：MEMORY.md和memory/目录是最重要的
3. **定时任务**：cron目录记得备份
4. **扩展不用备份**：重装后通过ClawHub重新安装

---

### 🚀 快速备份命令

**立即备份核心数据**：
```bash
cd ~ && tar -czf openclaw-backup-$(date +%Y%m%d).tar.gz \
  .openclaw/openclaw.json \
  .openclaw/workspace \
  .openclaw/cron \
  .openclaw/agents \
  .openclaw/media
```

**解压备份**：
```bash
tar -xzf openclaw-backup-20260210.tar.gz
```

---

## 📝 总结

**必须备份的3个目录**：
1. ✅ `~/.openclaw/openclaw.json` - 配置
2. ✅ `~/.openclaw/workspace/` - 工作区（最重要）
3. ✅ `~/.openclaw/cron/` - 定时任务

**可选备份**：
- agents/
- media/
- devices/
- identity/

**不用备份**：
- extensions/ (3.4GB，重装会重新下载)

---

**建议**：现在就运行一次备份，确保数据安全！
