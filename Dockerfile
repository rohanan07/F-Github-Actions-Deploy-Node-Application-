# Use a lightweight node image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy the rest of the code
COPY . .

# Expose the app port
EXPOSE 3000

# Start the application
CMD ["node", "app.js"]