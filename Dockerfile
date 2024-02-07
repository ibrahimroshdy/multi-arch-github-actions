# Docker image as python for system requirment (Installing requirements for debian environment)
FROM  python:3.11-slim
LABEL org.opencontainers.image.source https://github.com/ibrahimroshdy/continuous_integration
LABEL org.opencontainers.image.description "A sample project of adding continuous integration to GitHub and utilising the GitHub actions, workflows and job settings."

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

RUN python -m venv /opt/venv
# Make sure we use the venv (virtual environment)
ENV PATH="/opt/venv/bin:$PATH"

# Install python packages and dependencies
RUN pip install poetry   && \
    poetry config virtualenvs.create false


# copy poetry packages file
COPY pyproject.toml ./
RUN poetry install --no-interaction --no-ansi

# Setup workdir for contaier
WORKDIR /app

# copying working files at workdir
COPY simple_loop.py simple_loop.py

# Make file executable
RUN chmod +x simple_loop.py

# Entrypoint
CMD ["python","simple_loop.py"]


