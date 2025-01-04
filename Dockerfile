FROM node:22-slim

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

# Create tsup config
RUN echo 'import { defineConfig } from "tsup";\n\nexport default defineConfig({\n  entry: ["src/index.ts"],\n  format: ["esm"],\n  dts: true,\n  clean: true,\n});\n' > tsup.config.ts

# Build the application
RUN pnpm build

# Start the application
CMD ["pnpm", "start"] 