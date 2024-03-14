#!/bin/bash

# 设定默认值

# 检查Dockerfile和nginx.conf是否存在
if [ ! -f app/Dockerfile ] || [ ! -f app/nginx.conf ]; then
    echo "Error: Dockerfile 或 nginx.conf 在当前目录中不存在。"
    exit 1
fi

read -p "请输入Docker仓库空间 (默认为 'registry.cn-chengdu.aliyuncs.com/sc-citms'): " NAME_SPACE
NAME_SPACE=${NAME_SPACE:-registry.cn-chengdu.aliyuncs.com/sc-citms}

echo "将Docker仓库空间名称: $NAME_SPACE"

read -p "请输入Docker镜像名称 (默认为 'app'): " IMAGE_NAME
IMAGE_NAME=${IMAGE_NAME:-app}

read -p "请输入Docker镜像标签 (默认为 'latest'): " TAG
TAG=${TAG:-latest}

echo "将使用镜像名称: $NAME_SPACE/$IMAGE_NAME 和标签: $TAG"

FULL_IMAGE_NAME=$NAME_SPACE/$IMAGE_NAME:$TAG

build_image() {
    # 显示将要构建的镜像信息
    echo "Building Docker image with name: $FULL_IMAGE_NAME"
    # 构建Docker镜像
    docker buildx build  --platform=linux/amd64 -t $FULL_IMAGE_NAME app -f app/Dockerfile
    # 检查构建是否成功
    if [ $? -ne 0 ]; then
        echo "Error: Failed to build Docker image."
        exit 1
    else
        echo "Docker image $IMAGE_NAME:$TAG has been built successfully."
    fi
}
push_image() {
    # 显示将要推送的镜像信息
    echo "Pushing Docker image with name: $FULL_IMAGE_NAME"
    # 推送Docker镜像
    docker push $FULL_IMAGE_NAME
}

build_image


# 提示用户输入并读取响应
read -p "是否推送镜像到仓库:? [y/n]: " response

# 将用户的输入转换为小写（可选，确保无论大小写都能正确匹配）
response=$(echo "$response" | tr '[:upper:]' '[:lower:]')
# 使用if-else结构进行判断
if [[ "$response" == "y" ]]; then
    push_image
fi


