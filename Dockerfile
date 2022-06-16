FROM python:3-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apk update && apk add build-base libffi-dev libpq-dev

WORKDIR /app

COPY . .

RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade poetry

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
