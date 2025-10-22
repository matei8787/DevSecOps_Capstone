# pull official base image
FROM python:3.12-slim-bookworm

# set work dir
WORKDIR /usr/src/app

# set env vars
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# install OS deps
RUN apt update -y && apt upgrade -y && apt install netcat-openbsd -y

# install python deps
COPY ./requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# copy the entrypoint
COPY ./bugtracker/entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/app/entrypoint.sh && chmod +x /usr/src/app/entrypoint.sh

# copy the project
COPY . .

# Run the Entrypoint
ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]