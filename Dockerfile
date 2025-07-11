# ===== Stage 1: Angular Build =====
FROM node:18-alpine AS builder

WORKDIR /app
COPY . .

ARG BUILD_ENV
RUN echo "📦 Building with Angular config: ${BUILD_ENV}"
RUN npm install
RUN npm run build -- --configuration=${BUILD_ENV}

# ===== Stage 2: Serve with Nginx =====
FROM nginx:alpine
COPY --from=builder /app/dist/bhs-frontend/browser /usr/share/nginx/html
