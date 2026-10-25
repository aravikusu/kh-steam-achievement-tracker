FROM node:20-alpine AS builder
WORKDIR /staging
COPY . /staging/
RUN npm ci && \
  npm run build && \
  npm prune --omit=dev

FROM node:20-alpine
WORKDIR /app
COPY --from=builder /staging/package.json /staging/package-lock.json  /app/
COPY --from=builder /staging/node_modules /app/node_modules
COPY --from=builder /staging/build /app/build

EXPOSE 3000
CMD ["node",  "/app/build/index.js"]
