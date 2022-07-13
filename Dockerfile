# syntax=docker/dockerfile:1
FROM postgres:12-alpine
COPY books-please.sql /docker-entrypoint-initdb.d/
# WORKDIR /app
# COPY . .
# RUN yarn install --production
# CMD ["node", "src/index.js"]
# EXPOSE 3000