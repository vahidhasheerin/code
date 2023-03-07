#
FROM python:3.8-slim-buster

#install dependecies
RUN apt-get update && apt-get install -y --no-install-recommends \
     python3-pip \
     wget \
     gnupg2 \
     python3-dev \
     python3-setuptools \
     libtiff5-dev \
     libjpeg62-turbo-dev \
     libopenjp2-7-dev \
     zlib1g-dev \
     libfreetype6-dev \
     liblcms2-dev \
     libwebp-dev \
     tcl8.6-dev \
     tk8.6-dev \
     python3-tk \
     libharfbuzz-dev \
     libfribidi-dev \
     libxcb1-dev \
     #python3 -m pip install --upgrade Pillow \
     && \
     apt-get clean && \
     rm -rf /var/lib/apt/lists/*
RUN  python3 -m pip install --upgrade Pillow
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable

# Create working directory
WORKDIR /usr/src/app/

#copy necessary files to working directory
RUN pip3 install bokeh
copy browsertimer.py ./
copy exec.sh ./
RUN chmod +x /usr/src/app/exec.sh

#Execute the script
CMD ["sh","/usr/src/app/exec.sh"]
