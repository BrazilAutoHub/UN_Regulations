# GitHub 上传指南

本指南将帮助您将 UN ECE 汽车法规文档上传到 GitHub，并通过 GitHub Pages 在线分享。

## 📋 准备工作

### 1. 注册 GitHub 账号（如果还没有）

**访问**：https://github.com

**注册要求**：
- 邮箱：任意邮箱即可（QQ、163、Gmail 等都可以）
- 手机号：**不需要海外手机号**，中国手机号可以注册
- 费用：**完全免费**

**注册步骤**：
1. 点击 "Sign up"（注册）
2. 输入邮箱、密码、用户名
3. 选择免费计划（Free）
4. 验证邮箱
5. 完成

### 2. 安装 Git（如果还没有）

**macOS**：
```bash
# 方法1：使用 Xcode Command Line Tools
xcode-select --install

# 方法2：使用 Homebrew
brew install git
```

**验证安装**：
```bash
git --version
```

## 🚀 上传步骤

### 方法一：使用命令行（推荐）

#### 步骤 1：创建 GitHub 仓库

1. 登录 GitHub
2. 点击右上角 "+" → "New repository"
3. 填写信息：
   - **Repository name**：`UN_Regulations`
   - **Description**：`UN ECE 汽车法规文档库`
   - **Public**：选择公开（免费）
   - **勾选**：Add a README file
4. 点击 "Create repository"

#### 步骤 2：在本地初始化 Git

打开终端，执行以下命令：

```bash
# 进入法规文件夹
cd /Users/mac/.qianfan/workspace/1eb030de60f44514b54d2dc782686858/UN_Regulations

# 初始化 Git 仓库
git init

# 配置用户信息（如果还没配置）
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"

# 添加所有文件
git add .

# 提交更改
git commit -m "添加 UN ECE 汽车法规文档

- 16 个法规的 HTML 介绍页面
- 16 个法规的 Word 摘要文档
- 16 个法规的全文翻译 Word 文档
- 总计 48 个文档"

# 添加远程仓库（替换 YOUR_USERNAME 为你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/UN_Regulations.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

#### 步骤 3：输入 GitHub 凭据

推送时需要输入：
- **用户名**：你的 GitHub 用户名
- **密码**：**不是你的登录密码**，而是 Personal Access Token

**创建 Personal Access Token**：
1. 登录 GitHub
2. 点击头像 → Settings → Developer settings → Personal access tokens → Tokens (classic)
3. 点击 "Generate new token (classic)"
4. 勾选权限：至少勾选 `repo`
5. 点击 "Generate token"
6. **复制并保存 token**（只显示一次）

### 方法二：使用 GitHub Desktop（图形界面）

#### 步骤 1：下载安装 GitHub Desktop

**下载地址**：https://desktop.github.com

#### 步骤 2：登录 GitHub 账号

1. 打开 GitHub Desktop
2. File → Options → Accounts → Sign in
3. 输入 GitHub 用户名和密码

#### 步骤 3：创建仓库并上传

1. File → New Repository
2. 填写信息：
   - Name：`UN_Regulations`
   - Local path：选择本地路径
3. 点击 "Create Repository"
4. 将所有文件复制到仓库文件夹
5. 在 GitHub Desktop 中：
   - 填写 Summary（提交说明）
   - 点击 "Commit to main"
   - 点击 "Publish repository"

### 方法三：直接上传（最简单）

#### 步骤 1：创建仓库

按照方法一的步骤 1 创建仓库

#### 步骤 2：上传文件

1. 在仓库页面点击 "uploading an existing file"
2. 将文件夹中的所有文件拖拽到上传区域
3. 填写提交信息
4. 点击 "Commit changes"

**注意**：此方法适合文件较少的情况，如果文件很多建议使用方法一或方法二。

## 🌐 启用 GitHub Pages

上传完成后，启用 GitHub Pages 让文档在线访问：

1. 进入仓库页面
2. 点击 "Settings"（设置）
3. 左侧菜单找到 "Pages"
4. 在 "Source" 下选择：
   - Branch：`main`
   - Folder：`/ (root)`
5. 点击 "Save"
6. 等待几分钟，页面会显示访问地址：
   ```
   https://YOUR_USERNAME.github.io/UN_Regulations/
   ```

## ✅ 验证上传成功

### 检查仓库内容

访问：`https://github.com/YOUR_USERNAME/UN_Regulations`

确认：
- ✅ 所有文件都已上传
- ✅ README.md 正确显示
- ✅ 文件结构完整

### 检查 GitHub Pages

访问：`https://YOUR_USERNAME.github.io/UN_Regulations/`

确认：
- ✅ 索引页面正常显示
- ✅ 所有 HTML 链接可访问
- ✅ Word 文档可下载

## 🔗 分享链接

上传成功后，可以通过以下方式分享：

### 1. 仓库主页
```
https://github.com/YOUR_USERNAME/UN_Regulations
```

### 2. GitHub Pages（在线浏览）
```
https://YOUR_USERNAME.github.io/UN_Regulations/
```

### 3. 单个文件下载
```
https://github.com/YOUR_USERNAME/UN_Regulations/raw/main/R11_03_full.docx
```

## ❓ 常见问题

### Q1：推送时提示 "fatal: 'origin' already exists"

**解决方案**：
```bash
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/UN_Regulations.git
```

### Q2：推送时提示 "fatal: Authentication failed"

**解决方案**：
- 确认用户名正确
- 使用 Personal Access Token 而不是密码
- 检查 token 权限是否包含 `repo`

### Q3：GitHub Pages 显示 404

**解决方案**：
- 等待 5-10 分钟让 GitHub 构建页面
- 确认 Settings → Pages 中已启用
- 确认分支和文件夹选择正确

### Q4：文件太大无法上传

**解决方案**：
- GitHub 单文件限制 100MB
- 如果文件超过限制，使用 Git LFS：
  ```bash
  git lfs install
  git lfs track "*.docx"
  git add .gitattributes
  git commit -m "启用 Git LFS"
  ```

### Q5：如何更新文档

**解决方案**：
```bash
# 添加新文件或修改现有文件
git add .

# 提交更改
git commit -m "更新文档"

# 推送到 GitHub
git push
```

## 📱 移动端访问

GitHub Pages 支持移动端访问，无需任何额外配置。访问者可以直接在手机浏览器中打开链接查看文档。

## 🔄 自动更新

如果需要定期更新文档，可以：

1. **本地更新**：
   ```bash
   git add .
   git commit -m "更新文档"
   git push
   ```

2. **使用 GitHub Actions**（高级）：
   - 创建自动化工作流
   - 定期从数据源更新文档

## 📊 访问统计

GitHub 提供 Insights 功能，可以查看：
- 访问量
- 访问者地区
- 热门文件
- 克隆次数

访问：`https://github.com/YOUR_USERNAME/UN_Regulations/pulse`

## 🎉 完成！

恭喜！您已成功将 UN ECE 汽车法规文档上传到 GitHub。

现在可以：
- ✅ 通过链接分享给他人
- ✅ 在线浏览所有文档
- ✅ 下载 Word 文档离线使用
- ✅ 持续更新和维护

---

**需要帮助？**
- [GitHub 官方文档](https://docs.github.com)
- [GitHub Pages 文档](https://docs.github.com/pages)
- [Git 官方文档](https://git-scm.com/doc)
