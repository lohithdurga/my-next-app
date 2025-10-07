# Stage 1: build
FROM node:18-alpine AS builder
WORKDIR /app

# copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# copy source code and build the Next.js app
COPY . .
RUN npm run build

# Stage 2: production image
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

# copy only the required files from builder
COPY --from=builder /app/package*.json ./
RUN npm ci --production
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

EXPOSE 3000
CMD ["npm", "start"]
