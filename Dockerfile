FROM centos

RUN yum update -y
RUN yum install -y wget vim tmux curl git bzip2 epel-release && \
    yum install -y python-pip R unixODBC unixODBC-devel libxml2-devel libcurl-devel openssl-devel sssd-tools initscripts krb5-workstation krb5-libs krb5-auth-dialog enchant python-devel
COPY install-packages.r /install-packages.r
COPY requirements.txt /requirements.txt
COPY ClouderaImpalaODBC-2.5.41.1029-1.el5.x86_64.rpm /ClouderaImpalaODBC-2.5.41.1029-1.el5.x86_64.rpm
COPY installSpark.r /installSpark.r
COPY start-rserver.sh /start-rserver.sh
RUN R -f /install-packages.r
RUN pip install -r /requirements.txt && \
    wget https://download2.rstudio.org/rstudio-server-rhel-1.1.383-x86_64.rpm && \
    yum install -y --nogpgcheck rstudio-server-rhel-1.1.383-x86_64.rpm && \
    yum install -y --nogpgcheck /ClouderaImpalaODBC-2.5.41.1029-1.el5.x86_64.rpm && \
    python -m spacy download en && \
    R -f /installSpark.r && \
    rm /rstudio-server-rhel-1.1.383-x86_64.rpm /ClouderaImpalaODBC-2.5.41.1029-1.el5.x86_64.rpm && \
    chmod +x /start-rserver.sh
EXPOSE 8787

CMD ['start-rserver.sh']