FROM neilmillard/rstudio:rserver

COPY install-packages.r /install-packages.r
COPY requirements.txt /requirements.txt
COPY installSpark.r /installSpark.r

RUN pip install -r /requirements.txt
RUN R -f /install-packages.r

COPY ClouderaImpalaODBC-2.5.41.1029-1.el5.x86_64.rpm /ClouderaImpalaODBC-2.5.41.1029-1.el5.x86_64.rpm
RUN yum install -y --nogpgcheck /ClouderaImpalaODBC-2.5.41.1029-1.el5.x86_64.rpm && \
    rm /ClouderaImpalaODBC-2.5.41.1029-1.el5.x86_64.rpm && \
    python -m spacy download en && \
    R -f /installSpark.r
