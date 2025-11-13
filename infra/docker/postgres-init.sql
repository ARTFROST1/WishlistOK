-- Initialize PostgreSQL database for WishApp
-- This script runs when the PostgreSQL container is first created

-- Create test database
CREATE DATABASE wishapp_test OWNER wishapp;

-- Grant all privileges to the wishapp user
GRANT ALL PRIVILEGES ON DATABASE wishapp_development TO wishapp;
GRANT ALL PRIVILEGES ON DATABASE wishapp_test TO wishapp;

-- Enable required extensions (if needed in the future)
-- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- CREATE EXTENSION IF NOT EXISTS "pg_trgm";
