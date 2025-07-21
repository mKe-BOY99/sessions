# Base image Node 20
FROM node:20-slim

# Set working directory
WORKDIR /app

# Kopi package.json ak package-lock.json (si genyen)
COPY package*.json ./

# Enstale pm2 globalman
RUN npm install -g pm2

# Enstale depandans app la
RUN npm install

# Kopi tout kòd app la nan container la
COPY . .

# Expose pò si app lan sèvi ak yon pò espesifik (chanje si w itilize lòt pò)
EXPOSE 3000

# Anviwònman pwodiksyon
ENV NODE_ENV=production

# Kòmanse app lan ak pm2 selon script ou
CMD ["pm2-runtime", "index.js", "--deep-monitoring", "--attach", "--name", "malvin-xd"]
