
export OS=$(uname)

if [[ "${OS}"  == "Linux" ]]; then
  export PATH="$PATH:/usr/lib/cargo/bin/"
else
  PREFIX="$BREW_PREFIX/opt"
  ZLIB="${PREFIX}/zlib"
  BZIP2="${PREFIX}/bzip2"
  READLINE="${PREFIX}/readline"
  SQLITE="${PREFIX}/sqlite"
  OPENSSL="${PREFIX}/openssl@3"
  FFI="${PREFIX}/libffi"
  TCLTK="${PREFIX}/tcl-tk"
  PGSQL="${PREFIX}/postgresql@10"
  GNUTLS="${PREFIX}/gnutls"
  LIBS=('ZLIB' 'BZIP2' 'READLINE' 'SQLITE' 'OPENSSL' 'PGSQL' 'TCLTK' 'FFI', 'GNUTLS')

  export CMAKE_HOME_DIRECTORY=$BREW_PREFIX/bin/cmake
  export PATH="$PATH:/opt/homebrew/Cellar/mysql-client/8.1.0/bin:/opt/local/bin:/opt/local/sbin:$BREW_PREFIX/opt/gcc/bin:$BREW_PREFIX/opt/qt/bin:$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$BREW_PREFIX/libexec/gnubin:$BREW_PREFIX/share/luarocks/bin"
  export QT_DIR="$BREW_PREFIX/opt/qt@5"
  export QT_VERSION=5.15.2
  export QT_API=5.13.0
  export HDF5_DIR=/opt/homebrew/opt/hdf5 
  export BLOSC_DIR=/opt/homebrew/opt/c-blosc
fi

ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
DISABLE_MAGIC_FUNCTIONS=true
ZSH_EVALCACHE_DIR=$HOME/.cache/zsh-eval

export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export DISABLE_LS_COLORS=true
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export NEOVIDE_FORK=1

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$ASDF_DIR/shims/python3
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

#####################
# ENV VARIABLE      #
#####################
export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
# export SHELL=$BREW_PREFIX/bin/zsh
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
if [[ "${OS}"  != "Linux" ]]; then
  export BAT_THEME=gruvbox-dark
fi
export PIP_REQUIRE_VIRTUALENV=false
# export NODE_BUILD_ARIA2_OPTS="--https-proxy='http://127.0.0.1:7890' --http-proxy='http://127.0.0.1:7890'"
export NODE_BUILD_HTTP_CLIENT="curl"
# export ARCHFLAGS="-arch x86_64"

export SSH_KEY_PATH="~/.ssh/id_rsa"
export EPREFIX="/opt/gentoo"

export MACOSX_DEPLOYMENT_TARGET=14.0

export HOMEBREW_GITHUB_API_TOKEN="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"
# export HOMEBREW_NO_AUTO_UPDATE=false
# export HOMEBREW_AUTO_UPDATE_SECS=86400
export HOMEBREW_NO_ENV_HINTS=true
export BW_SESSION="5RkWAkT1bH2fotYdRX0tQScg9fbu9JEbXAHZ/zX1I/Wijh3kxXoGZpO9g5d2/oreZUZAR/UHlT/40xaaprYK5A=="
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles


export GEOVIM_PATH="$HOME/.config/nvim/geovim"
if [ -d ${GEOVIM_PATH} ]; then
  export GEOVIM_EDITOR="nvim" # Set to "vim" to use Vim
  export GEOVIM_TMUX=0 # Set to 0 to disable TMUX
  export GEOVIM_TERM="alacritty"
  # export GEOVIM_TERM="kitty"
  source "$GEOVIM_PATH/geovim.sh"
fi

export RSYNC_RSH="ssh -T -c aes128-ctr -o Compression=no -x"

PS1='$(show_virtual_env)'$PS1

# ASDF
export GOPATH=$HOME/Code/dotfiles/golang-packages
export PATH="$GOPATH/bin:$PATH"
#export ASDF_FFMPEG_ENABLE="gcrypt gnutls gpl hardcoded-tables ladspa libaom libass libbluray libcodec2 libdav1d libdavs2 libdrm libfdk-aac libfontconfig libfreetype libmfx libmodplug libmp3lame libopencv libopenh264 libopenmpt libopus libpulse librav1e libspeex libsrt libsvtav1 libtensorflow libv4l2 libvmaf libvorbis libvpx libwebp libx264 libx265 libxavs libxavs2 libxvid lto lv2 macos-kperf mediacodec mediafoundation nonfree opengl ossfuzz"

export ENABLE_FLUTTER_DESKTOP=true

export PATH="$PATH:/usr/local/bin:/usr/local/sbin"

#####################
# FZF SETTINGS      #
#####################
FD_OPTIONS="--hidden --follow"
export FZF_DEFAULT_OPTS="
--ansi
--info inline
--height 40%
--prompt 'λ -> '
--pointer '|>'
--marker '✓'
--border
--layout reverse
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
# export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS || git ls-files --cached --others --exclude-standard"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND='ag --follow --hidden --ignore .git -g ""'
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
# export FZF_COMPLETION_OPTS="-x"

#####################
# FZF SETTINGS      #
#####################
# --layout=default
# export FZF_DEFAULT_OPTS="
# --ansi
# --layout reverse
# --info inline
# --height 50%
# --multi
# --cycle
# --preview-window right:50%,sharp,cycle
# --prompt 'λ -> '
# --pointer '|>'
# --marker '✓'
# --bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
# --bind 'ctrl-v:execute(code {+})'"
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_DEFAULT_COMMAND='fzf'
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
# --preview 'bat --style=numbers --color=always --line-range :500 {}'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


#####################
# GO SETTINGS       #
#####################
export GO111MODULE=on
export CGO_ENABLED=on
# export CGO_CFLAGS='-g -O2 -mmacosx-version-min=10.14'
# export CGO_LDFLAGS='-g -O2 -mmacosx-version-min=10.14'
export CGO_CFLAGS='-g -O2'
export CGO_LDFLAGS='-g -O2'
export GOPRIVATE=gitlab.com/sohunjug/*,github.com/go-sohunjug/*,gitlab.com/cta-service/*,git.kkws.cn

# --preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
for LIB in $LIBS; do

  BINDIR="${(P)LIB}/bin"
  if [ -d "${BINDIR}" ]; then
    export PATH="${BINDIR}:$PATH"
  fi

  LIBDIR="${(P)LIB}/lib"
  if [ -d "${LIBDIR}" ]; then
    export LDFLAGS="-L${LIBDIR} $LDFLAGS"
    # export DYLD_LIBRARY_PATH="${LIBDIR}:$DYLD_LIBRARY_PATH"
    PKGCFGDIR="${LIBDIR}/pkgconfig"
    if [ -d "${PKGCFGDIR}" ]; then
      export PKG_CONFIG_PATH="${PKGCFGDIR} $PKG_CONFIG_PATH"
    fi
  fi

  INCDIR="${(P)LIB}/include"
  if [ -d "${INCDIR}" ]; then
    export CFLAGS="-I${INCDIR} $CFLAGS"
  fi

done

if [[ "${OS}" != "Linux" ]]; then
  export LDFLAGS="${LDFLAGS} -L$BREW_PREFIX/lib"
  export CPPFLAGS="${CFLAGS}"
  export CPPFLAGS="${CPPFLAGS} -I$BREW_PREFIX/include"
  export CXXFLAGS="${CPPFLAGS}"
fi

# [[ ! -f $HOME/.fzf.zsh       ]] || source $HOME/.fzf.zsh
