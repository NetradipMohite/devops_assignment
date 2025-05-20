#NodeJs_Dockerfile
```
# Base image
FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose port (example: 5000)
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
```

#React_app_Dockerfile
```
# Base image
FROM node:18

# Set working directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the code
COPY . .

# Build the React app
RUN npm run build

# Use Nginx to serve the build
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

#Docker_compose.yml
```
version: "3.9"

services:
  node-api:
    build: ./nodejs_app
    ports:
      - "5000:5000"
    restart: unless-stopped
    container_name: node_api_service

  react-frontend:
    build: ./react_app
    ports:
      - "3000:80"
    restart: unless-stopped
    container_name: react_frontend_service
```
