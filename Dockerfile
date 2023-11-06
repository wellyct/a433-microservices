## Dockerfile untuk order-service

FROM node:14.21.3-alpine3.17

# working dir di kontainer
WORKDIR /app

# copy kode proyek ke working dir kontainer
COPY . .

# install dependensi
RUN npm install

# env kontainer
ENV PORT=3000

# expose port 3000/tcp
EXPOSE 3000

# perintah memulai aplikasi
CMD ["npm", "start"]