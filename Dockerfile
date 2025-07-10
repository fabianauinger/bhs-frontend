# 1. Build-Phase mit Node.js
FROM node:18 as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --configuration production

# 2. Produktiv-Phase mit NGINX
FROM nginx:stable-alpine
COPY --from=builder /app/dist/bhs-frontend /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
