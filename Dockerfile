# Stage 1: Jekyll Build Stage
FROM bretfisher/jekyll-serve:latest AS builder

# Set environment variables
ENV JEKYLL_UID=1000
ENV JEKYLL_GID=1000
ENV JEKYLL_ENV=production

# Copy the site files to the container
WORKDIR /site
COPY . /site

# Build the Jekyll site
RUN bundle install && \
    bundle exec jekyll build --trace

# Stage 2: NGINX Server Stage
FROM nginx:alpine

# Copy the built Jekyll site from the build stage
COPY --from=builder /site/_site /usr/share/nginx/html

# Optional: Copy custom NGINX configuration if needed
COPY config.nginx /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
