#
FROM ubuntu:18.04

#install dependecies

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.6 \
    python3-pip \
    wget \
    gnupg2 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
#RUN apt-get update
#RUN apt-get install python

#install app dependencies
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable

# Create working directory
WORKDIR /usr/src/app/

#copy necessary files to working directory
#COPY requirements.txt ./
RUN pip3 install bokeh
copy browsertimer.py ./
copy exec.sh ./
RUN chmod +x /usr/src/app/exec.sh

#configure port
#ENV PORT 8082
#EXPOSE $PORT

CMD ["sh","/usr/src/app/exec.sh"]

