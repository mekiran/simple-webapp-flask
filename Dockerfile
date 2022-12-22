FROM ubuntu:22.04

# Install python 3.7
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install python3.7 -y

RUN apt install -y python3-pip
RUN apt-get install -y --no-install-recommends \
     build-essential \
     libssl-dev \
     libffi-dev \
     python3-dev

#Install venv
# RUN python3 -m pip install --upgrade pip

RUN pip install --upgrade pip
RUN pip install flask
COPY app.py /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
