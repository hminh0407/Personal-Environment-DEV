#!/usr/bin/env bash

# Create database if not exist
psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'test_db'" | grep -q 1 || psql -U postgres -c "CREATE DATABASE test_db"