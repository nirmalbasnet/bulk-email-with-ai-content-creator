###########################
# Build stage
FROM node:22.17.1-alpine3.21 AS build

# Set working directory
WORKDIR /app

# Install build dependencies only
COPY package.json yarn.lock ./

# Use yarn cache for faster builds
RUN yarn install --frozen-lockfile

# Copy only necessary files for build
COPY . .

# Build the app
RUN yarn build

###########################
# Run stage
FROM node:22.17.1-alpine3.21 AS prod

# Set working directory
WORKDIR /app

# Set NODE_ENV
ENV NODE_ENV=production

# Copy only production dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production

# Copy built app from build stage
COPY --from=build /app/dist ./dist


# Start the app
CMD ["node", "dist/index.js"]
