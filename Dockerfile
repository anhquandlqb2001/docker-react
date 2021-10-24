# Phase 1: build
FROM node:14.15.0-alpine AS builder

WORKDIR /usr/app

COPY . .
RUN yarn

CMD ["yarn", "build"]

# Phase 2: run
FROM nginx:alpine

COPY --from=builder /usr/app/build /usr/share/nginx/html
