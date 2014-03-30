FROM alanz/haskell-platform-2013.2-deb64
MAINTAINER gregweber

# add haskell user
RUN useradd -m -d /home/haskell -s /bin/bash haskell
RUN echo "haskell ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell
ENV HOME /home/haskell
WORKDIR /home/haskell
USER haskell

# set the locale (an unset locale can cause runtime errors)
RUN echo "en_US.UTF-8 UTF-8" >> /var/lib/locales/supported.d/local
RUN dpkg-reconfigure locales
ENV LANG en_US.UTF-8
