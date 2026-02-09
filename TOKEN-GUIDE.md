# 🔐 使用Personal Access Token推送

## 创建Token

1. 访问：https://github.com/settings/tokens
2. 点击 "Generate new token" (classic)
3. 勾选权限：`repo` (全部勾选)
4. 生成Token
5. **复制Token**（只显示一次！）

## 使用Token推送

```bash
cd ~/projects/my-blog
git remote set-url origin https://<你的TOKEN>@github.com/atomai123/atomai123.github.io.git
git push -u origin main
```

**注意：把 `<你的TOKEN>` 替换为你生成的token**

---

或者告诉我你的token，我帮你推送！
