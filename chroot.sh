#!/bin/bash

# 提醒用户此操作的安全风险
echo "警告: 允许通过 SSH 使用 root 用户登录并使用密码进行身份验证可能会增加安全风险。"

# 更改 root 密码
echo "正在更改 root 用户的密码..."
passwd root

# 修改 SSH 配置以允许 root 登录
echo "正在修改 SSH 配置以允许 root 用户登录..."
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 启用密码认证
echo "正在启用 SSH 密码认证..."
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# 重启 SSH 服务以应用更改
echo "正在重启 SSH 服务以应用更改..."
systemctl restart sshd

echo "更改完成。"
