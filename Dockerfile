FROM node:14-slim

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

COPY . .
ARG NODE_ENV=production
RUN npm run build

USER 1000
EXPOSE 3000

ENTRYPOINT [ "npm", "run", "start" ]
