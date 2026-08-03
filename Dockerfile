# syntax=docker/dockerfile:1
# check=error=true

FROM node:20.19.2-alpine
    ENV NODE_ENV=production

    WORKDIR /unleash
    RUN --mount=type=bind,source=package.json,target=package.json \
        --mount=type=bind,source=package-lock.json,target=package-lock.json \
        --mount=type=cache,target=/root/.npm \
        NODE_ENV=production npm ci --no-audit
    RUN rm -rf /usr/local/lib/node_modules/npm/

    COPY index.js ./
    EXPOSE 4242
    USER node
    CMD ["node", "index.js"]
