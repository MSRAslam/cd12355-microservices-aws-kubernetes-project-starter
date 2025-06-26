FROM public.ecr.aws/docker/library/python:3.8-slim

# Install dependencies
RUN apt update -y && apt install -y build-essential libpq-dev

# Set workdir
WORKDIR /app

# Copy code
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

# Expose the app port
EXPOSE 5153

# Run the app
CMD ["python", "app.py"]