## Dockerfile untuk shipping-service

# node.js alpine sebagai base image dengan size terkecil
FROM node:14.21.3-alpine3.17

# Menentukan direktori kerja di dalam kontainer
WORKDIR /app

# Menyalin seluruh kode proyek Anda ke dalam kontainer
COPY . .

# Menginstall dependensi yang dibutuhkan
RUN npm install

# deklarasi environtment yang dibutuhkan
ENV PORT=3001

# expose port 3001
EXPOSE 3001

# Menjalankan perintah untuk memulai aplikasi Express.js
CMD ["npm", "start"]