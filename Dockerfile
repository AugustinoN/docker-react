# Building Phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Running Phase
FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html
