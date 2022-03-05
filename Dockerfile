FROM node:16.14-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.21.6-alpine

COPY --from=builder /app/build /usr/share/nginx/html
