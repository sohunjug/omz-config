# zinit load mafredri/zsh-async
# async_init

# lazyenv-enabled
# async_start_worker lazy -n

update_env() {
    export CONFIGURE_OPTS="--enable-framework --with-lto=yes --enable-ipv6"
    if [[ "${OS}"  != "Linux" ]]; then
        export SDKROOT=$(xcrun --show-sdk-path)
        export SDK_PATH=$SDKROOT

        # TCLTK=$(brew --prefix tcl-tk)
        export CFLAGS="-I${SDK_PATH}/usr/include/sasl $CFLAGS"
        export CFLAGS="-I${SDK_PATH}/usr/include $CFLAGS"
        export LDFLAGS="-L${SDK_PATH}/usr/lib $LDFLAGS"
        # export PYTHON_CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl) ${PYTHON_CONFIGURE_OPTS}"
        export PYTHON_BUILD_USE_HOMEBREW=1
    fi
    # export PYTHON_CONFIGURE_OPTS="--with-openssl=$PREFIX/openssl@1.1 ${PYTHON_CONFIGURE_OPTS}"
    # export TCLTK_LIBS="-L$PREFIX/tcl-tk/lib -ltcl8.6 -ltk8.6"
    # export TCLTK_CFLAGS="-I$PREFIX/tcl-tk/include"
    # export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I$PREFIX/tcl-tk/include' ${PYTHON_CONFIGURE_OPTS}"
    # export PYTHON_CONFIGURE_OPTS="--with-tcltk-libs='-L$PREFIX/tcl-tk/lib -ltcl8.6 -ltk8.6' ${PYTHON_CONFIGURE_OPTS}"
    # export PYTHON_CFLAGS='-march=native -mtune=native'
}

lazy_eval() {
    # eval "$(fasd --init auto)"
    eval "$(direnv hook zsh)"
    eval "$(thefuck --alias)"
    compdef _pipenv pipenv
    # eval "$($BREW_PREFIX/bin/brew shellenv)"
    # evalcache thefuck --alias
    # evalcache fasd --init auto
    # evalcache direnv hook zsh
}

_pipenv() {
    eval "$(COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE="complete-zsh" pipenv)"
}


lazy_pipenv() {
    compdef _pipenv pipenv
}

# async_job lazy lazy_env

update_env
# unfunction lazy_env

lazy_eval
unfunction lazy_eval

#lazyload python python3 pip -- 'lazy_pipenv'
