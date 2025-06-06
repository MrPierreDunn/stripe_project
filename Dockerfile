FROM python:3.11.9-bullseye

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

ENV POETRY_VERSION=1.7.0
RUN curl -sSL https://install.python-poetry.org | python3 - --version $POETRY_VERSION

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

COPY pyproject.toml poetry.lock* /app/

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

COPY . /app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0:8000"]
