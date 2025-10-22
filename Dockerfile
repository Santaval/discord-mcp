# Use official Node.js LTS image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --production

# Copy the rest of the code
COPY . .

# Build the project
RUN npm run build

# Expose the default HTTP port
EXPOSE 400

# Start the MCP server
CMD ["npm", "run", "start"]