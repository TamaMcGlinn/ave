FROM anatolelucet/neovim:nightly-ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y git wget curl

# Install plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN mkdir /tools
WORKDIR /tools

# Install alire
RUN wget https://github.com/alire-project/alire/releases/download/v1.2.0/alr-1.2.0-x86_64.AppImage -O /tools/alr
RUN chmod +x /tools/alr
RUN echo "#!/bin/bash\n/tools/alr --appimage-extract-and-run \$@" > /usr/bin/alr
RUN chmod +x /usr/bin/alr
RUN alr toolchain --select gnat_native
RUN alr toolchain --select gprbuild

# Install ada_language_server
RUN mkdir -p /root/.local/bin/
RUN wget https://open-vsx.org/api/AdaCore/ada/22.0.8/file/AdaCore.ada-22.0.8.vsix -O als.zip
RUN mkdir ada_language_server
RUN apt-get install -y unzip
RUN unzip als.zip -d ada_language_server
RUN rm als.zip
RUN chmod +x /tools/ada_language_server/extension/linux/ada_language_server 
RUN ln -s "/tools/ada_language_server/extension/linux/ada_language_server" /usr/bin/ada_language_server

# Unfortunately these are missing after GNAT2021 -> alr transition
# so I've just copied them into this repository
COPY /tools/gnatls /usr/bin/
COPY /tools/gprbuild /usr/bin/
COPY /tools/gnatpp /usr/bin/

# python3 support in nvim
RUN apt-get install -y python3-pip
RUN pip3 install neovim

# the vimrc
COPY /vimrc /vimrc/
RUN mkdir -p /root/.config/nvim
RUN mv /vimrc/lua /root/.config/nvim/
RUN nvim -u '/vimrc/plug_framework.vim' -c 'PlugInstall' -c 'qall!'
RUN mkdir -p /root/.config/nvim/
RUN ln -fs /vimrc/vimrc.vim /root/.config/nvim/init.vim

# Add to vimrc without having to reinstall plugins (TODO move this into vimrc properly)
# COPY additional_vimrc.vim /vimrc/
# RUN echo 'source /vimrc/additional_vimrc.vim' >> /vimrc/vimrc.vim
