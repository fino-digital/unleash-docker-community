# syntax=docker/dockerfile:1
# check=error=true

ARG NODE_VERSION=20.19.2-alpine

FROM node:$NODE_VERSION AS builder

    WORKDIR /unleash
    COPY index.js package.json package-lock.json ./
    RUN NODE_ENV=production npm ci --no-audit

FROM node:$NODE_VERSION AS runner
    ENV NODE_ENV=production

    WORKDIR /unleash
    COPY --from=builder /unleash /unleash
    RUN rm -rf /usr/local/lib/node_modules/npm/
    EXPOSE 4242
    USER node
    CMD ["node", "index.js"]
