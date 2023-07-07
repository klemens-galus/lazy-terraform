FROM ubuntu:22.04

#CREATE THE USER ANSIBLE W/ PASSWORD
RUN adduser --disabled-password \
--gecos '' terraform

VOLUME /home/terraform/lazy-terraform

RUN apt update && \
    apt-get -y install sudo && \
    apt install -y wget && \
    apt install -y gnupg software-properties-common && \
    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt update && \
    apt install -y terraform

RUN adduser terraform sudo

#CREATE THE USER ANSIBLE TO THE SUDOER W/ PASSWORD
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.48.0/terragrunt_linux_amd64 && \
    mv terragrunt_linux_amd64 /usr/local/bin/terragrunt

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

#SOMETIME SOMES '\r' NEED TO BE REMOVED 
RUN sed -i 's/\r$//' /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/terragrunt

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER terraform

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["bash"]


    