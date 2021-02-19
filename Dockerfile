FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

# Elastic Beanstalk uses this for exposing ports for traffic
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html