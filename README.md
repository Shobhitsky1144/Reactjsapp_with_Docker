
=======================================>>>>> RUN REACT-DOCKER APP WITYH DOCKER FILE================>>>>>>>

STEP 1==>>Dockerfile:

FROM node:alpine

WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application files
COPY . ./

# Command to start the application
CMD ["npm", "run", "dev"]


STEP 2==> viteconfig.ts:

// viteconfig.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    host: true,
    watch: {
      usePolling: true
    }
  }
})

How to run React app with docker:

step3--docker build -t react-img .

step4-- docker run --rm -p 5173:5173 -v %cd%:/app --name react_container react-img



=========================>>>>>> RUN REACT-DOCKER APP WITH DOCKER-COMPOSE.YML=============>>>>>>>>>>>>>>>>>>>>>>>>>>>>

STEP 1 ==> IN DOCKER COMPOSE FILE==>

version: "3.4"
services:
  vite_docker:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: vite_docker
    ports:
      - "5173:5173"
    volumes:
      - type: bind
        source: ./
        target: /app

   STEP2==>2. viteconfig.ts:

// viteconfig.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    host: true,
    watch: {
      usePolling: true
    }
  }
})

STEP 3==> docker-composeup

Description:
This project setup allows for the development of a React.js application using Vite and Docker. The Dockerfile sets up the Node.js environment and installs the necessary dependencies. The viteconfig.ts file configures Vite for React, enabling faster development. The docker-compose file coordinates the building and running of the Docker container.

Instructions:
Clone the repository using git clone https://github.com/Shobhitsky1144/Reactjsapp_with_Docker.
Make sure Docker is installed on your machine.
Navigate to the project directory in the terminal.
Run docker-compose up to build and start the container.
Access the application at localhost:5173.




