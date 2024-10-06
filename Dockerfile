# Use an official Python runtime as a parent image
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Step 4: Install dependencies (First copy only requirements.txt to leverage Docker caching)
COPY requirements.txt /app/

# Install dependencies (this layer will only re-run if requirements.txt changes)
RUN pip install --upgrade pip && pip install -r requirements.txt

# Step 5: Copy the application code (Any code changes will trigger a rebuild)
COPY . /app/

# Expose the port that the app will run on
EXPOSE 8080

# Command to run the app with Gunicorn
# Gunicorn is set to listen on 0.0.0.0:8000 with 4 worker processes
CMD ["gunicorn", "--workers", "12", "--bind", "0.0.0.0:8080", "apps:apps"]
