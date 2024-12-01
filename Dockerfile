# Use the original web application's image as the base
FROM fallenbagel/jellyseerr:latest

# Set working directory
WORKDIR /app

# Install patch utility in Alpine
RUN apk add --no-cache patch

# Copy your patch file into the container
COPY changes.patch /app/changes.patch

# Apply the patch (adjusting the -p option based on directory depth)
RUN patch -p2 < changes.patch

# Clean up package lists to reduce image size
RUN rm -rf /var/cache/apk/*

# Clean up the patch file
RUN rm changes.patch