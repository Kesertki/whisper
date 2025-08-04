# Whisper Docker Image

This is a Dockerfile for building a Docker image that contains the [OpenAI Whisper](https://github.com/openai/whisper) project. It allows you to run the Whisper model for speech recognition tasks.

## Running from Docker Hub

You can pull the pre-built Docker image from Docker Hub using the following command:

```bash
docker pull kesertki/whisper
```

## Running the Docker Container

To run the Docker container, use the following command:

```bash
docker run --rm -v $(pwd):/app kesertki/whisper /app/input.wav --model=tiny --output_format=json --language=en --output_dir=/app
```

This command mounts the current directory to `/app` inside the container, allowing you to process audio files located in your current directory. Replace `input.wav` with the name of your audio file.


## Building the Docker Image

To build the Docker image, run the following command in the directory containing the Dockerfile:

```bash
docker build -t whisper .
```

Building the image will install the Whisper library and its dependencies. You can specify a different model by using the `--build-arg MODEL=<model_name>` option, where `<model_name>` can be one of the following:

- `tiny`
- `base`
- `small`
- `medium`
- `large`
- `tiny.en`
- `base.en`
- `small.en`
- `medium.en`

If you do not specify a model, it defaults to `tiny`.

### Building with a specific model

```bash
docker build --build-arg MODEL=tiny -t whisper-tiny .
docker build --build-arg MODEL=base -t whisper-base .
```
