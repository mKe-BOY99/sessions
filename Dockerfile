FROM node:20-slim

WORKDIR /app

# Kopi package.json
COPY package*.json ./

# Enstale git ak pm2
RUN apt-get update && apt-get install -y git && npm install -g pm2

# Enstale depandans yo
RUN npm install

# Kopi rès fichye yo
COPY . .

EXPOSE 3000
ENV NODE_ENV=production

CMD ["pm2-runtime", "index.js", "--deep-monitoring", "--attach", "--name", "malvin-xd"]
