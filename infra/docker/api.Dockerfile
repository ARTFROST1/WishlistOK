# Use Ruby 3.3.6 base image
FROM ruby:3.3.6-slim

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      nodejs \
      npm \
      git \
      curl \
      imagemagick \
      libvips42 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Set PATH for bundle executables
ENV PATH="/usr/local/bundle/bin:$PATH"

# Copy application code first
COPY backend/ .

# Ensure lockfile contains container platforms before install
RUN bundle lock --add-platform x86_64-linux || true

# Install Ruby dependencies (non-deployment for dev image)
RUN bundle install --jobs 4 --retry 3

# Skip binstubs to avoid exec format issues

# Precompile assets (if needed in future)
# RUN bundle exec rails assets:precompile

# Create tmp and log directories
RUN mkdir -p tmp/pids log

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl -f http://localhost:3000/up || exit 1

# Default command
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
