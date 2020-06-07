# Build server
FROM node:12-alpine as builder

WORKDIR /usr/app

COPY package.json .
RUN yarn install

COPY . .

RUN yarn build

# Production server
FROM nginx:alpine

WORKDIR /usr/app

COPY --from=builder /usr/app/dist /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
