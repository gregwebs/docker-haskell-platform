# sudo docker build -t IHaskell:dev .
#
# run in the browser
# sudo docker run -p 8778:8778 IHaskell:dev
#
# run this with a terminal
# sudo docker run -rm -i -t IHaskell:dev console


FROM alanz/haskell-platform-2013.2-deb64
MAINTAINER gregweber

# cleanup from previous images
RUN rm -f /ghc-7.6.3-x86_64-unknown-linux.tar.bz2 && rm -rf /ghc-7.6.3
RUN rm -f /haskell-platform-2013.2.0.0.tar.gz && rm -rf /haskell-platform-2013.2.0.0

RUN useradd -m -d /home/haskell -s /bin/bash haskell
RUN echo "haskell ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell
ENV HOME /home/haskell
WORKDIR /home/haskell
USER haskell
