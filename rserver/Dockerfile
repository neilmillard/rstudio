FROM neilmillard/rstudio:base

COPY start-rserver.sh /start-rserver.sh

RUN wget https://download2.rstudio.org/rstudio-server-rhel-1.1.383-x86_64.rpm && \
    yum install -y --nogpgcheck rstudio-server-rhel-1.1.383-x86_64.rpm && \
    rm /rstudio-server-rhel-1.1.383-x86_64.rpm && \
    chmod +x /start-rserver.sh
EXPOSE 8787

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

CMD ["./start-rserver.sh"]