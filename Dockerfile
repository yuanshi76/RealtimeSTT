FROM ubuntu:22.04 as cpu

WORKDIR /app

RUN apt-get update -y && \
  apt-get install -y python3 python3-pip portaudio19-dev

RUN pip3 install torch==2.3.0 torchaudio==2.3.0

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

EXPOSE 9001
ENV PYTHONPATH "${PYTHONPATH}:/app"
RUN export PYTHONPATH="${PYTHONPATH}:/app"
CMD ["python3", "example_browserclient/server.py"]
