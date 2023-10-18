# - Multi-Staged Build Dockerfile

# Stage 1: Build Stage
FROM node:20 AS builder

# Set the working directory inside the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json .

# Install dependencies based on package.json
RUN npm install 

# Copy all the files from the current directory (where Dockerfile is located) to /app
COPY . .

# Stage 2: Final Stage
FROM node:20-alpine 

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the built files from the builder stage to the final image
COPY --from=builder /app /app

# Expose port 3000 to allow incoming connections
EXPOSE 3000

# Define the default command to run the application
CMD ["node","index.js"]





# General DockerFile
# # Use Node.js version 20 as the base image`
# FROM node:20
# # Set the working directory inside the container to /app
# WORKDIR /app
# # Copy package.json and package-lock.json to the working directory
# COPY package*.json .
# # Install dependencies based on package.json
# RUN npm install
# # Copy all the files from the current directory (where Dockerfile is located) to /app
# COPY . .
# # Expose port 3000 to allow incoming connections
# EXPOSE 3000

# # Define the default command to run the application
# CMD ["node", "index.js"]






















