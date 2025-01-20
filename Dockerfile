FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm config set legacy-peer-deps true
RUN npm install
COPY . .
RUN npm run build
#CMD ["npm" , "run" , "build"]

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html


