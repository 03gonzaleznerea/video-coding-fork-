FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Add the /app directory to the Python module path
ENV PYTHONPATH=/app

# Install system dependencies, including ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Copy project files into the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Streamlit default port
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "app/main_streamlit.py", "--server.port=8501", "--server.address=0.0.0.0"]