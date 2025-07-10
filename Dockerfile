# 1. Build Stage
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# 2. Production Stage mit NGINX
FROM nginx:alpine

# Angular build wird in den NGINX Web Root kopiert
COPY --from=build /app/dist/bhs-frontend/browser /usr/share/nginx/html

# Optional: Umgebungsvariablen für NGINX setzen
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./dist /usr/share/nginx/html
COPY ./env/prod.json /usr/share/nginx/html/assets/env.json


# Optional: NGINX config anpassen, wenn nötig
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
