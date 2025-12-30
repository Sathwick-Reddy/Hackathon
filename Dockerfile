# Use Node.js 18 LTS as the base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Copy client directory
COPY client ./client

# Install server dependencies
RUN npm install

# Install client dependencies
RUN cd client && npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN cd client && npm run build

# Expose port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]