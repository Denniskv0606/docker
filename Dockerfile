#Mention the base image
FROM ubuntu:18.04

#Setting environment varibales
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

#Execute these actions
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install ca-certificates gnupg --yes
#COPY ca-certificates/* /usr/local/share/ca-certificates/
#COPY cyberfend.list /etc/apt/sources.list.d/cyberfend.list
#COPY debrepogpg.pub /usr/local/share/ca-certificates/debrepogpg.pub
#RUN apt-key add /usr/local/share/ca-certificates/debrepogpg.pub
RUN update-ca-certificates
RUN apt-get update

#Setting Label
LABEL Description="Cyberfend ubuntu 18.04 base image" Vendor="Akamai" Version="1.0"

## Run the specified command within the container.
CMD ["/usr/bin/apt-get","install","python3", "--yes"]

#Expose ports in container
EXPOSE 8080/tcp
