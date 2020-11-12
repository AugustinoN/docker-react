# Building Phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Running Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
