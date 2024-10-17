# Use the official Deno image as the base
FROM denoland/deno:alpine-1.37.0

# Install bash and curl
RUN apk add --no-cache bash curl

# Set working directory inside the container
WORKDIR /app

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Add Bun's bin path to the environment
ENV PATH="/root/.bun/bin:$PATH"

# Copy all files from the current directory to the container
COPY . .

# Install dependencies with Bun
RUN bun install

# Build the Vite app
RUN bun vite build

# Expose the port where the app will run (typically 3000 for Vite apps)
EXPOSE 8080

# Command to start the Vite app
CMD ["bun", "vite", "preview", "--host"]
