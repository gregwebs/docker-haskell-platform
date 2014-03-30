FROM alanz/haskell-platform-2013.2-deb64
MAINTAINER gregweber

# add haskell user
RUN useradd -m -d /home/haskell -s /bin/bash haskell
RUN echo "haskell ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/haskell && chmod 0440 /etc/sudoers.d/haskell
ENV HOME /home/haskell
WORKDIR /home/haskell
USER haskell

# setup path for cabal executables
ENV PATH ~/.cabal/bin:.cabal-sandbox/bin:$PATH

# set the locale (an unset locale can cause runtime errors)
ENV LANG en_US.UTF-8
