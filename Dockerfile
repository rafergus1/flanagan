# Use the official lightweight Node.js 10 image.
# https://hub.docker.com/_/node
FROM node:17-slim

RUN set -ex; \
  apt-get -y update; \
  apt-get -y install ghostscript; \
  apt-get -y install pngquant; \
  rm -rf /var/lib/apt/lists/*

# Create and change to the app directory.
WORKDIR /

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install dependencies.
# If you add a package-lock.json speed your build by switching to 'npm ci'.
RUN npm ci --only=production
# RUN npm install --production


# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD [ "npm", "start" ]