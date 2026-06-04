FROM python:3.11-slim


WORKDIR .
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo
COPY . .
RUN pip3 install -r requirements.txt
RUN apt install ffmpeg

CMD gunicorn app:app & python3 main.py
