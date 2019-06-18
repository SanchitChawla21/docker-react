FROM node as build
WORKDIR /app/usr
COPY package.json .
RUN npm install
COPY . .
CMD [ "npm" "run" "build" ]

FROM Nginx
COPY --from=build /app/usr/build  /usr/share/nginx/html



