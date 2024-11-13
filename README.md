# FastAPI Text2Text Generator with Docker

This project is a FastAPI application that uses Hugging Face's `transformers` library for text-to-text generation. The model used is `google/flan-t5-small`. The application exposes two endpoints:
- `/` - A simple hello world message.
- `/generate` - A text generation endpoint that accepts a query parameter and returns generated text.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Docker Setup](#docker-setup)
- [API Endpoints](#api-endpoints)
- [Troubleshooting](#troubleshooting)

## Features
- FastAPI web framework for building APIs.
- Hugging Face `transformers` pipeline for text-to-text generation.
- Dockerized for easy deployment.

## Requirements
- Python 3.9+
- FastAPI
- Uvicorn
- Transformers

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/Vishal2053/fastapi-text2text-generator.git
cd fastapi-text2text-generator
```

### 2. Create a Virtual Environment (Optional but recommended)
```bash
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
```

### 3. Install dependencies
```bash
pip install --upgrade pip
pip install -r requirements.txt
```

### 4. Run the FastAPI application
```bash
uvicorn app:app --host 0.0.0.0 --port 7860
```

## Usage
You can access the application in your browser at `http://localhost:7860`.

## Docker Setup

### 1. Build the Docker Image
Make sure you are in the project directory where the Dockerfile is located.

```bash
docker build -t fastapi-text2text-generator .
```

### 2. Run the Docker Container
```bash
docker run -d -p 7860:7860 fastapi-text2text-generator
```

### 3. Access the Application
Open your browser and go to:
```
http://localhost:7860
```

## API Endpoints

### 1. Home Endpoint
- **URL**: `/`
- **Method**: `GET`
- **Response**: 
  ```json
  {
    "message": "Hello World"
  }
  ```

### 2. Text Generation Endpoint
- **URL**: `/generate`
- **Method**: `GET`
- **Query Parameter**: `text` (The input text to generate output from)
- **Example**: `/generate?text=Hello%20AI`
- **Response**:
  ```json
  {
    "output": "Generated text from the model"
  }
  ```

## Sample Request using `curl`
```bash
curl -X GET "http://localhost:7860/generate?text=Once%20upon%20a%20time"
```

## Sample Request using Python
```python
import requests

response = requests.get("http://localhost:7860/generate", params={"text": "What is AI?"})
print(response.json())
```

## Troubleshooting

### Common Issues
- **Error**: `exec: "uvicorn": executable file not found in $PATH`
  - **Solution**: Ensure `uvicorn` is installed and available in the Docker environment. Make sure it’s included in your `requirements.txt` file.

- **Error**: `OCI runtime create failed`
  - **Solution**: Ensure the `uvicorn` command is correctly set in the Dockerfile. You may need to specify `python -m uvicorn` instead.

### Useful Docker Commands
- To stop all running containers:
  ```bash
  docker stop $(docker ps -q)
  ```
- To remove all stopped containers:
  ```bash
  docker rm $(docker ps -a -q)
  ```

## Contributing
Feel free to open an issue or submit a pull request if you find a bug or want to contribute to this project.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

