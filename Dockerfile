# Use the official Python image
FROM python:3.11-slim

# Update and install required packages
RUN apt-get update && apt-get install -y \
    && apt-get install -y --no-install-recommends \
    python3-dev \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Install JupyterLab
RUN pip install --no-cache-dir jupyterlab

# Expose port 8080
EXPOSE 8080

# Start JupyterLab on port 8080 without authentication
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8080", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
