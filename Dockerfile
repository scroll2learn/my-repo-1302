FROM python:3.7-slim

WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir Flask gunicorn

# Copy app + templates
COPY app.py /app/app.py
COPY templates /app/templates

# Expose (optional for local usage)
EXPOSE 5000

# Run with gunicorn (PORT comes from environment; default 5000)
CMD exec gunicorn --bind 0.0.0.0:${PORT:-5000} --workers 1 --threads 8 --timeout 0 app:app

