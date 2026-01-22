# Base image
FROM python:3.11-slim

# Working directory inside the container
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --no-build-isolation --progress-bar off -r requirements.txt

# Copy application code
COPY app.py .

# Expose Flask port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
