FROM python:3.10-slim-buster

WORKDIR /app

# Install system dependencies required for pip and building packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    libffi-dev \
    libpq-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Copy app files
COPY . /app

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip \
 && pip install -r requirements.txt

# Run the app
CMD ["python3", "app.py"]
