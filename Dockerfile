FROM node:14.16.0-alpine3.13
RUN addgroup app-user && adduser -S -G app-user app-user
USER app-user
WORKDIR /app
RUN mkdir data
COPY package*.json .
RUN npm install
COPY . .
EXPOSE 3000
ENV WATCHPACK_POLLING=true
CMD ["npm", "start"]