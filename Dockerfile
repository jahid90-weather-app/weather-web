# Build server
# FROM node:12-alpine as builder

# WORKDIR /usr/app

# COPY package.json .
# RUN yarn install

# COPY . .

# RUN yarn build

# Production server
FROM nginx:alpine

# COPY --from=builder /usr/app/dist /usr/share/nginx/html/
COPY ./dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
