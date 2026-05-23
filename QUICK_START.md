# 快速开始指南

## 🎯 三步上传到 GitHub

### 第一步：创建 GitHub 仓库

1. 访问 https://github.com 并登录
2. 点击右上角 **+** → **New repository**
3. 填写信息：
   - Repository name: `UN_Regulations`
   - 选择 **Public**
   - 勾选 **Add a README file**
4. 点击 **Create repository**

### 第二步：运行上传脚本

打开终端，执行：

```bash
cd /Users/mac/.qianfan/workspace/1eb030de60f44514b54d2dc782686858/UN_Regulations
bash quick_upload.sh YOUR_GITHUB_USERNAME
```

**替换 `YOUR_GITHUB_USERNAME` 为你的 GitHub 用户名**

### 第三步：启用 GitHub Pages

1. 进入仓库页面
2. 点击 **Settings** → **Pages**
3. Source 选择：
   - Branch: `main`
   - Folder: `/ (root)`
4. 点击 **Save**
5. 等待几分钟，访问：`https://YOUR_USERNAME.github.io/UN_Regulations/`

## ✅ 完成！

现在你可以：
- 分享链接给其他人
- 在线浏览所有文档
- 下载 Word 文档

## 📞 需要帮助？

查看详细指南：[UPLOAD_GUIDE.md](UPLOAD_GUIDE.md)
