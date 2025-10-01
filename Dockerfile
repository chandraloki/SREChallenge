 # Install required system packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends build-essential git && rm -rf /var/lib/apt/lists/*

# Install Python 3.12
RUN uv python install 3.12

# Copy project files
COPY . .

# Install python dependencies
RUN uv sync
# Expose service port
EXPOSE 8000

# Run application with uvicorn
CMD ["uv", "run", "uvicorn", "main:api", "--host", "0.0.0.0", "--port", "8000", "--log-config", "logging.yaml"]
