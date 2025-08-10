# Dockerfile for Flask App
FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

# Download wait-for-it script
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Use wait-for-it in entrypoint
CMD ["/wait-for-it.sh", "mysql-container:3306", "--", "python", "app.py"]
