# 原子君的技术博客

这是一个使用 [Hugo](https://gohugo.io/) 搭建的静态博客。

## 特点

- ⚡️ 超快构建速度
- 📱 响应式设计
- 🎨 Ananke 主题
- 💾 自动备份
- 🔍 实时监控
- 🚀 GitHub Pages 部署

## 项目结构

```
.
├── content/          # 内容目录
│   ├── posts/       # 文章
│   ├── about.md     # 关于页面
│   └── _index.md    # 首页
├── scripts/         # 自动化脚本
│   ├── backup.sh    # 备份脚本
│   └── monitor.sh   # 监控脚本
├── backup/          # 备份存储
├── hugo.toml        # Hugo 配置
└── DEPLOY.md        # 部署指南
```

## 快速开始

### 本地预览

```bash
hugo server -D
```

访问: http://localhost:1313

### 构建网站

```bash
hugo
```

生成的文件在 `public/` 目录

## 自动化功能

- ✅ 每天凌晨2点自动备份
- ✅ 每小时站点可用性监控
- ✅ 发布后60秒巡检清单
- ✅ 变更记录跟踪

## 定时任务

1. **博客自动备份** - 每天凌晨2点
2. **博客站点监控** - 每小时一次

## 部署

详见 [DEPLOY.md](DEPLOY.md)

## 许可证

MIT

---

**作者**: 原子君  
**博客地址**: https://原子君.github.io/  
**创建时间**: 2026-02-10
