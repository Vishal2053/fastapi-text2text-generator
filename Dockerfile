# Use the official Python 3.9 image
FROM python:3.9

# Set the working directory to /code
WORKDIR /code

# Copy only the requirements.txt to leverage Docker cache
COPY ./requirements.txt /code/requirements.txt

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r /code/requirements.txt

# Set up a new user named "user" 
RUN useradd -m user  # Add '-m' flag to create the home directory

# Switch to the "user" user
USER user

# Set environment variables for home and PATH
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# Set the working directory to the user's home directory
WORKDIR $HOME/app

# Copy the entire current directory to the container, setting the owner to the user
COPY --chown=user:user . $HOME/app

# Ensure that the necessary permissions are set
RUN chmod -R 755 $HOME/app

# Expose the port on which FastAPI will run
EXPOSE 7860

# Start the FastAPI app on port 7860
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]
