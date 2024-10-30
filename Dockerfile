# Use an offical python image
FROM python:3.13-slim AS base

# Set enviroment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements/ /requirements/
RUN pip install --upgrade pip
RUN pip install -r /requirements/base.txt

# Development stage with dev dependencies
FROM base AS development
RUN pip install -r /requirements/dev.txt
COPY . /app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Production stage with prod dependencies
FROM base AS production
RUN pip install -r /requirements/prod.txt
COPY . /app
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "devnest.wsgi:application"]