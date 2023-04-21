#FROM joyzoursky/python-chromedriver:latest
#FROM qnib/pytest  
FROM python:3.8
COPY requirnments.txt requirnments.txt
RUN pip3 install -r requirnments.txt
COPY .  /test
WORKDIR /test/
CMD /bin/bash  
