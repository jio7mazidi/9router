FROM node:20-alpine
# نصب ابزارهای مورد نیاز برای کامپایل پکیج‌های بومی لینوکس مثل sqlite
RUN apk add --no-cache python3 make g++
WORKDIR /app
COPY package*.json ./
RUN npm install
# نصب دستی پکیج گمشده
RUN npm install better-sqlite3
COPY . .
RUN npm run build
EXPOSE 3000
ENV PORT=3000
ENV HOSTNAME="0.0.0.0"
ENV NODE_ENV=production
CMD ["node", ".next/standalone/server.js"]
