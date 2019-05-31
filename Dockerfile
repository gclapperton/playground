FROM node:12.3.1-alpine AS builder

WORKDIR /home/node

COPY . /home/node

RUN npm install && npm run build

#==========================================================
FROM nginx:1.16.0-alpine

COPY --from=builder /home/node/dist /usr/share/nginx/html