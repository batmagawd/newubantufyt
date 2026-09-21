FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server sudo

RUN mkdir /var/run/sshd

# Root ka password set karo (apna strong password daalo)
RUN echo 'root:MyStrongPassword123' | chpasswd

# Root login allow karo
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 8080

CMD ["/usr/sbin/sshd", "-D", "-p", "8080"]
