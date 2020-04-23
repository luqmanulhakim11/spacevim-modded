FROM superiorornot/arch-base-spacevim:20200423-1

RUN pacman -Syu --noconfirm

ENV HOME /home/me

ENV TERM xterm-256color

RUN useradd --create-home --home-dir $HOME -s /usr/bin/fish me && chown -R me $HOME

USER me

WORKDIR $HOME

RUN pip install --user neovim pipenv

RUN git clone --bare https://gitlab.com/luqmanulhakim11/dotfiles.git &&\
      git --git-dir="$HOME/dotfiles.git" --work-tree=$HOME checkout

RUN $HOME/setup.sh

RUN nvim --headless +'call dein#install()' +qall

ENTRYPOINT /usr/bin/fish