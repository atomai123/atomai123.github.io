# 🚀 博客快速启动指南

## 本地预览

```bash
cd ~/projects/my-blog
hugo server -D
```

访问: http://localhost:1313

## 新建文章

```bash
hugo new posts/my-new-post.md
```

编辑 `content/posts/my-new-post.md`

## 构建网站

```bash
hugo
```

生成的文件在 `public/` 目录

## 部署到GitHub Pages

### 1. 创建GitHub仓库

1. 在GitHub创建新仓库：`原子君.github.io`
2. 推送代码到GitHub

```bash
cd ~/projects/my-blog
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/原子君/原子君.github.io.git
git push -u origin main
```

### 2. 启用GitHub Pages

1. 进入仓库 Settings
2. 选择 Pages
3. Source: GitHub Actions
4. 保存

### 3. 自动部署

推送代码后，GitHub Actions会自动构建和部署！

## 自定义域名

1. 在 `public/` 创建 `CNAME` 文件
2. 添加域名：`blog.yourdomain.com`
3. 在DNS中添加CNAME记录

## 更新内容

```bash
# 1. 修改或新建文章
# 2. 本地测试
hugo server -D

# 3. 构建并推送
hugo
git add .
git commit -m "Update blog"
git push
```

## 自动化

- ✅ 每天凌晨2点自动备份
- ✅ 每小时站点监控
- ✅ 推送即部署

---
*更新时间：2026-02-10*
