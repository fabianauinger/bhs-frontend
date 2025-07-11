# Dockerfile

# ======= STAGE 1: Bestehendes dev-image als Basis =======
FROM ghcr.io/YOUR_USER/bhs-frontend:dev AS base

# ======= STAGE 2: Test-Build erstellen =======
FROM node:18-alpine AS builder

WORKDIR /app
COPY --from=base /app /app

ARG BUILD_ENV=test
RUN npm install
RUN npm run build -- --configuration=$BUILD_ENV

# ======= STAGE 3: Deployment mit Nginx =======
FROM nginx:alpine
COPY --from=builder /app/dist/bhs-frontend /usr/share/nginx/html
