# Use an official Node.js runtime as a parent image
FROM node:18-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy backend and frontend files to the container
COPY backend/ ./backend
COPY frontend/ ./frontend

# Build your app (if you have any build steps, include them here)
# For example, if you are using a build tool like Webpack, you can add:
# RUN npm run build

# Use another Node.js runtime image as the base for the final image
FROM node:18-slim

# Set the working directory
WORKDIR /app

# Copy the built files from the previous stage
COPY --from=builder /app .

# Expose port (optional, based on your app’s needs)
EXPOSE 9959

# Command to run your app
CMD ["node", "backend/server.js"]

