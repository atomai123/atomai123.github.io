# 博客部署指南

## 本地预览

```bash
cd ~/projects/my-blog
hugo server -D
```

访问: http://localhost:1313

## 构建博客

```bash
hugo
```

生成的文件在 `public/` 目录

## 部署到GitHub Pages

### 方法1：手动部署

```bash
# 1. 初始化Git仓库
cd ~/projects/my-blog
git init

# 2. 创建 gh-pages 分支
git checkout -b gh-pages

# 3. 构建博客
hugo

# 4. 提交到GitHub
git add .
git commit -m "Initial blog"
git push -u origin gh-pages
```

### 方法2：使用GitHub Actions自动化部署

创建 `.github/workflows/deploy.yml`:

```yaml
name: Deploy Hugo

on:
  push:
    branches: [ main ]

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true
          
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true
          
      - name: Build
        run: hugo --minify
        
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

## 自定义域名

1. 在 `~/projects/my-blog/` 创建 `CNAME` 文件
2. 添加你的域名（如 `blog.yourdomain.com`）
3. 在域名DNS中添加CNAME记录指向 `你的用户名.github.io`

## 监控脚本配置

修改 `scripts/monitor.sh` 中的博客地址为你的实际地址。

## 备份脚本

已配置每天凌晨2点自动备份。

---
*更新时间：2026-02-10*
