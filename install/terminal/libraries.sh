# Install libraries
if [ "$OS_TYPE" = "ubuntu" ]; then
  sudo apt install -y \
    build-essential ppa-purge pkg-config autoconf bison clang rustc \
    libssl-dev libreadline-dev zlib1g-dev libyaml-dev libncurses5-dev libffi-dev libgdbm-dev libjemalloc2 \
    libvips imagemagick libmagickwand-dev mupdf mupdf-tools gir1.2-gtop-2.0 gir1.2-clutter-1.0 \
    redis-tools sqlite3 libsqlite3-0 libmysqlclient-dev libpq-dev postgresql-client postgresql-client-common
elif [ "$OS_TYPE" = "macos" ]; then
  brew install \
    autoconf bison clang rust \
    openssl readline zlib yaml ncurses libffi gdbm jemalloc \
    vips imagemagick mupdf \
    redis sqlite mysql postgresql
fi
