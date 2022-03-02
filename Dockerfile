# 1. builder stage

FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

CMD ["npm", "run", "build"]

# 2. run stage

FROM nginx

EXPOSE 80

COPY --from=builder /usr/src/app/build /usr/share/nginx/html