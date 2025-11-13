# Use Ruby 3.3.6 base image
FROM ruby:3.3.6-slim

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      git \
      curl \
      imagemagick \
      libvips42 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY backend/Gemfile backend/Gemfile.lock ./

# Ensure lockfile contains container platforms before install
RUN bundle lock --add-platform x86_64-linux || true

# Install Ruby dependencies (non-deployment for dev image)
RUN bundle install --jobs 4 --retry 3

# Copy application code
COPY backend/ .

# Create tmp and log directories
RUN mkdir -p tmp/pids log

# Health check for Sidekiq
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD bundle exec sidekiq-healthcheck || exit 1

# Default command
CMD ["bundle", "exec", "sidekiq", "-e", "production"]
