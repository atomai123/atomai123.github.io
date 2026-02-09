# 🚀 博客部署到GitHub Pages

## 方法1：使用SSH密钥（推荐）

### 1. 生成SSH密钥

```bash
ssh-keygen -t ed25519 -C "atomai123@atomai123" -f ~/.ssh/github_ed25519
```

### 2. 查看公钥

```bash
cat ~/.ssh/github_ed25519.pub
```

### 3. 添加到GitHub
1. 访问：https://github.com/settings/ssh/new
2. 粘贴公钥内容
3. 点击 "Add SSH key"

### 4. 推送代码

```bash
cd ~/projects/my-blog
git remote set-url origin git@github.com:atomai123/atomai123.github.io.git
git push -u origin main
```

---

## 方法2：使用Personal Access Token

### 1. 创建Token

1. 访问：https://github.com/settings/tokens
2. 点击 "Generate new token" (classic)
3. 勾选：`repo` (全部权限)
4. 生成并复制token

### 2. 推送代码

```bash
cd ~/projects/my-blog
git remote set-url origin https://<token>@github.com/atomai123/atomai123.github.io.git
git push -u origin main
```

---

## 方法3：手动部署

如果git push有问题，可以：

1. 在GitHub上创建 `atomai123.github.io` 仓库
2. 上传 `public/` 目录的内容
3. 启用GitHub Pages

---

## 启用GitHub Pages

创建/推送完成后：

1. 进入仓库 **Settings**
2. 点击 **Pages**
3. Source 选择 **GitHub Actions**
4. 点击 **Save**

2-3分钟后，博客上线！

🌐 访问：https://atomai123.github.io/

---
*创建时间：2026-02-10*
