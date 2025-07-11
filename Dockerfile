# ====== Stage 1: Angular Build ======
FROM node:18-alpine AS builder

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build -- --configuration=$BUILD_ENV

RUN echo "🔍 BUILD_ENV: $BUILD_ENV"
RUN ls -la /app/dist && ls -la /app/dist/bhs-frontend


# ====== Stage 2: Serve with Nginx ======
FROM nginx:alpine
COPY --from=builder /app/dist/bhs-frontend/browser /usr/share/nginx/html
