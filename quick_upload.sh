#!/bin/bash

# UN ECE 汽车法规文档 - GitHub 快速上传脚本
# 使用方法：bash quick_upload.sh YOUR_GITHUB_USERNAME

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 打印带颜色的消息
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查参数
if [ -z "$1" ]; then
    print_error "请提供 GitHub 用户名"
    echo "使用方法: bash quick_upload.sh YOUR_GITHUB_USERNAME"
    exit 1
fi

USERNAME=$1
REPO_NAME="UN_Regulations"
REPO_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"

print_info "GitHub 用户名: ${USERNAME}"
print_info "仓库名称: ${REPO_NAME}"
print_info "仓库地址: ${REPO_URL}"

# 检查 Git 是否安装
if ! command -v git &> /dev/null; then
    print_error "Git 未安装，请先安装 Git"
    print_info "macOS 安装方法: xcode-select --install"
    exit 1
fi

print_info "Git 版本: $(git --version)"

# 进入法规文件夹
cd "/Users/mac/.qianfan/workspace/1eb030de60f44514b54d2dc782686858/UN_Regulations" || {
    print_error "无法进入法规文件夹"
    exit 1
}

print_info "当前目录: $(pwd)"

# 检查是否已初始化 Git
if [ -d ".git" ]; then
    print_warning "Git 仓库已存在"
    read -p "是否重新初始化？(y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf .git
        print_info "已删除旧的 Git 仓库"
    else
        print_info "使用现有 Git 仓库"
    fi
fi

# 初始化 Git 仓库
if [ ! -d ".git" ]; then
    print_info "初始化 Git 仓库..."
    git init
    print_info "Git 仓库初始化完成"
fi

# 配置 Git 用户信息
print_info "配置 Git 用户信息..."
read -p "请输入你的名字: " USER_NAME
read -p "请输入你的邮箱: " USER_EMAIL

git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

print_info "Git 用户信息已配置"
print_info "  用户名: $(git config user.name)"
print_info "  邮箱: $(git config user.email)"

# 添加所有文件
print_info "添加文件到 Git..."
git add .

# 显示将要提交的文件
print_info "将要提交的文件:"
git status --short

# 提交更改
print_info "提交更改..."
git commit -m "添加 UN ECE 汽车法规文档

- 16 个法规的 HTML 介绍页面
- 16 个法规的 Word 摘要文档  
- 16 个法规的全文翻译 Word 文档
- 总计 48 个文档

法规列表:
- R11.03/R11.04: 门锁和车门保持件
- R12.04: 转向机构碰撞保护
- R13H.01: 乘用车制动系统
- R139.00: 电子稳定性控制系统(ESC)
- R140.00: 轮胎压力监测系统(TPMS)
- R14.07/R14.08/R14.09: 安全带固定点、ISOFIX
- R16.06/R16.07/R16.08: 安全带及约束系统
- R17.08/R17.09/R17.10: 座椅、座椅固定点和头枕
- R21.01: 车辆内部安装件"

# 检查远程仓库
if git remote | grep -q "origin"; then
    print_warning "远程仓库 'origin' 已存在"
    git remote remove origin
    print_info "已删除旧的远程仓库配置"
fi

# 添加远程仓库
print_info "添加远程仓库..."
git remote add origin "$REPO_URL"

# 设置主分支
print_info "设置主分支..."
git branch -M main

# 推送到 GitHub
print_info "推送到 GitHub..."
print_warning "注意：推送时需要输入 GitHub 凭据"
print_info "用户名: 你的 GitHub 用户名"
print_info "密码: 使用 Personal Access Token（不是登录密码）"
print_info ""
print_info "如果还没有 Personal Access Token，请访问:"
print_info "https://github.com/settings/tokens"
print_info ""

read -p "按 Enter 键继续推送..."

if git push -u origin main; then
    print_info "✅ 推送成功！"
    echo ""
    print_info "🎉 恭喜！文档已成功上传到 GitHub"
    echo ""
    print_info "仓库地址: https://github.com/${USERNAME}/${REPO_NAME}"
    echo ""
    print_info "下一步："
    print_info "1. 访问仓库确认文件已上传"
    print_info "2. 启用 GitHub Pages（Settings → Pages）"
    print_info "3. 等待几分钟后访问: https://${USERNAME}.github.io/${REPO_NAME}/"
    echo ""
    print_info "详细说明请查看: UPLOAD_GUIDE.md"
else
    print_error "推送失败"
    print_info "请检查："
    print_info "1. GitHub 用户名是否正确"
    print_info "2. 仓库是否已在 GitHub 上创建"
    print_info "3. Personal Access Token 是否有效"
    print_info "4. 网络连接是否正常"
    exit 1
fi
