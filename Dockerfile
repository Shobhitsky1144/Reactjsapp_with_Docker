# Dockerfile
FROM node:alpine

WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application files
COPY . ./


CMD ["npm","run","dev"]
