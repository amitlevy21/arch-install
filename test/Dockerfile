FROM archlinux

RUN pacman -Syyu --noconfirm && pacman -S --noconfirm ansible git && mkdir /ansible

WORKDIR /ansible

COPY . .

CMD ["test/install.sh"]
