# Stage 1: Build the React application
FROM node:22-alpine AS builder
WORKDIR /app

# Accept build-time argument for backend API URL
ARG VITE_API_BASE_URL
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL

# Copy dependency manifests
COPY package.json package-lock.json ./
RUN npm ci

# Copy application source code and compile
COPY . .
RUN npm run build

# Stage 2: Serve static files with Nginx
FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Replace default Nginx configuration with SPA-compatible config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy production build output from builder stage
COPY --from=builder /app/dist ./

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
