FROM node:20-alpine3.16

# Tạo Forder `app` trong hệ điều hành trên
WORKDIR /app

# Copy các file cần thiết vào /app (Dấu chấm cuối cùng thể hiện điều đó)
COPY package.json .
COPY package-lock.json .
COPY tsconfig.json .
COPY ecosystem.config.js .
COPY .env.production .
COPY ./src ./src
COPY ./openapi ./openapi

# Cài các thư viện cho hệ điều hành
RUN apk add python3
RUN npm install pm2 -g
RUN npm install
RUN npm run build

# Port xuất ra để truy cập
EXPOSE 3000

# Run Server nó lên
CMD ["pm2-runtime", "start", "ecosystem.config.js", "--env", "production"]