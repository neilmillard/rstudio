FROM neilmillard/rstudio:base

COPY start-rserver.sh /start-rserver.sh
COPY rstudio-server-rhel-1.1.383-x86_64.rpm /rstudio-server-rhel-1.1.383-x86_64.rpm
RUN yum install -y --nogpgcheck /rstudio-server-rhel-1.1.383-x86_64.rpm && \
    rm /rstudio-server-rhel-1.1.383-x86_64.rpm && \
    chmod +x /start-rserver.sh
EXPOSE 8787

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN export PATH=/usr/lib/rstudio-server/bin/:$PATH
RUN useradd rstudio && \
    echo "rstudio:rstudio" | chpasswd
CMD ["./start-rserver.sh"]