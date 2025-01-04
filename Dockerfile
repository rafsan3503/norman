FROM node:18-slim

# Install build dependencies
RUN apt-get update && \
    apt-get install -y python3 make g++ git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Build the application
RUN pnpm build

# Start the application
CMD ["pnpm", "start"] 