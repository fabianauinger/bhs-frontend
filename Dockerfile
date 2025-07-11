FROM node:18-alpine AS builder

WORKDIR /app
COPY . .

ARG BUILD_ENV
ENV BUILD_ENV=${BUILD_ENV}

RUN echo "📦 Building with Angular config: $BUILD_ENV"
RUN npm install
RUN npm run build -- --configuration=${BUILD_ENV}

FROM nginx:alpine
COPY --from=builder /app/dist/bhs-frontend/browser /usr/share/nginx/html
