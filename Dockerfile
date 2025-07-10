# Use official Node image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install
COPY package*.json ./
RUN npm ci

# Copy source code and build
COPY . .

RUN npm run build

# Expose port and run app
EXPOSE 3000
CMD ["npm", "start"]