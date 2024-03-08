FROM ubuntu:24.04
RUN apt-get update \
&& apt-get dist-upgrade -y \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& apt-get install -y \
sudo \
nano \
wget \
curl \
git
RUN useradd -G sudo -m -d /home/Kristian2 -s /bin/bash -p "$(openssl passwd -1 Seminar2)" Kristiank02
USER Kristiank02
WORKDIR /home/Kristiank02
RUN mkdir hacking \
&& cd hacking \
&& curl -SL https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v24/pawned.sh > pawned.sh \
&& chmod 764 pawned.sh \
&& cd ..
RUN git config --global user.email "Kristian.kalleberg@hotmail.no"\
&& git config --global user.name "Kristiankalleberg" \
&& git config --global url."https://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:@github.com/".insteadOf "https://github.com" \
&& mkdir -p github.com/Kristiank02
USER root
RUN curl -SL https://go.dev/dl/go1.21.7.OS-ARCH.tar.gz \
| tar xvz -C /usr/local
USER Kristiank02
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/Kristiank02/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"