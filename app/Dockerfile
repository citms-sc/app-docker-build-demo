# 使用nginx的稳定版本作为基础镜像
FROM nginx:stable

# 将自定义的nginx配置文件复制到nginx的配置目录下
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
# 将构建出的应用静态文件复制到nginx的默认文档根目录下
COPY ./dist /usr/share/nginx/html

# 设置工作目录为nginx的默认文档根目录
WORKDIR /usr/share/nginx/html
# 定义容器对外暴露的端口
EXPOSE 80
# 指定容器启动时执行的命令，禁用nginx的后台运行模式
CMD ["nginx","-g","daemon off;"]