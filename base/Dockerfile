FROM centos

RUN yum update -y
RUN yum install -y wget vim tmux curl git bzip2 epel-release && \
    yum install -y python-pip R unixODBC unixODBC-devel libxml2-devel libcurl-devel openssl-devel sssd-tools initscripts krb5-workstation krb5-libs krb5-auth-dialog enchant python-devel
COPY start-rserver.sh /start-rserver.sh

RUN wget https://download2.rstudio.org/rstudio-server-rhel-1.1.383-x86_64.rpm && \
    yum install -y --nogpgcheck rstudio-server-rhel-1.1.383-x86_64.rpm && \
    rm /rstudio-server-rhel-1.1.383-x86_64.rpm && \
    chmod +x /start-rserver.sh
EXPOSE 8787

CMD ['start-rserver.sh']