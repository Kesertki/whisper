# Using latest python version in 3.10
FROM python:3.10.11-bullseye

# Install dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Whisper
RUN pip install git+https://github.com/openai/whisper.git

ARG MODEL=tiny
RUN whisper --model ${MODEL} dummy.webm; exit 0

ENTRYPOINT ["whisper"]
CMD ["--help"]
