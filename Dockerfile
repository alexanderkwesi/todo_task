# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Expose the port that the app will run on
EXPOSE 8080

# Command to run the app with Gunicorn
# Gunicorn is set to listen on 0.0.0.0:8000 with 4 worker processes
CMD ["gunicorn", "--workers", "7", "--bind", "0.0.0.0:8080", "apps:apps"]
