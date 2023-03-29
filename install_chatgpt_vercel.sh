#!/bin/bash

: '
# 脚本使用方法:
# 你可以将以下代码复制到一个文件中，例如 install_chatgpt_vercel.sh，然后通过以下命令使脚本文件可执行：
bash
Copy code
chmod +x install_chatgpt_vercel.sh
# 最后，你可以通过以下命令运行脚本文件：
bash
Copy code
./install_chatgpt_vercel.sh
# 请注意，脚本文件中的所有命令都需要以管理员权限运行，因此你可能需要使用 sudo 命令来运行脚本。
'

# 提示:此脚本由ChatGPT(https://chat.openai.com/chat/)生成,仅供参考,具体按照你的需求修改

# 安装 Node.js
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
sudo yum install -y nodejs

# 安装 Yarn
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install -y yarn

# 安装 PM2
sudo npm install -g pm2

# 克隆 ChatGPT-Vercel 项目
git clone https://github.com/ourongxing/chatgpt-vercel.git
cd chatgpt-vercel

# 安装依赖
yarn install

# 复制环境变量示例文件并编辑
cp .env.example .env
nano .env

# 启动项目
pm2 start yarn --name "chatgpt-vercel" -- start

# 保存 PM2 运行配置
pm2 save
