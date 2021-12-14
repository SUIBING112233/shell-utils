#! /usr/bin/bash

# Author:SUIBING112233

function check() {
    if [ -d $HOME/esp/esp-idf/examples/get-started/sample_project ]; then
        echo "command new   : OK"
    fi
    if [ -f $HOME/esp/esp-idf/tools/idf.py ]; then
        echo "command build : OK"
        echo "command clean : OK"
    fi
}

function setup() {

    if [ $2 == "cn" ]; then
        export IDF_GITHUB_ASSETS="dl.espressif.com/github_assets"
    fi

    echo "Installing dependence..."
    sudo apt-get install -y \
        git wget flex bison gperf python3 \
        python3-pip python3-setuptools \
        cmake ninja-build ccache libffi-dev \
        libssl-dev dfu-util libusb-1.0-0

    echo "Cloning idf..."
    mkdir -p $HOME/esp
    git clone --recursive https://github.com/espressif/esp-idf.git $HOME/esp
    bash $HOME/esp/esp-idf/install.sh all

}

function build() {
    . $HOME/esp/esp-idf/export.sh

    $HOME/esp/esp-idf/tools/idf.py build
}

function clean() {
    . $HOME/esp/esp-idf/export.sh
    $HOME/esp/esp-idf/tools/idf.py clean
}

function new() {
    cp -rf $HOME/esp/esp-idf/examples/get-started/sample_project/ ./$1
}

if [ $# == 0 ]; then

    echo "                   ESP-IDF utils"
    echo
    echo "This utils provide a sets of util for esp development,"
    echo "Used for:"
    echo "  1.Create a new project of esp-idf."
    echo "  2.Clean idf build caches."
    echo "  3.Flash idf build into your broad."
    echo "  4.Setup your idf development environment."
    echo
    echo "Supported commands:"
    echo "  setup [cn,gh]"
    echo "      This command will setup your esp-idf development environment."
    echo "      If you wanna change your download site, you can use it argument."
    echo "          - cn: Will download toolchains from China site."
    echo "          - gh: Will download toolchains from Github site. (default)"
    echo "      Maybe you wanna know where it installed? It will installed in $HOME/esp."
    echo "      For standard, I don't provide any chance to change installing path."
    echo "      NOTE: THE GIT CLONE STAGE STILL WILL CLONE FROM GITHUB."
    echo
    echo "  clean"
    echo "      This command will clean your esp-if project's build cache."
    echo "      It will clean build caches in your esp-idf project."
    echo "      Of course, it will clean your build results."
    echo "      NOTE: YOU MUST RUN THIS COMMAND UNDER YOUR IDF PROJECT's DIRECTORY."
    echo
    echo "  build [quiet]"
    echo "      This command will build your esp-if project."
    echo
    echo "  check"
    echo "      This command confirms what functions are available to you."
    echo
    echo "  new {name}"
    echo "      This command will setup a new project for you."
    echo

elif [ $1 == "setup" ]; then
    setup
elif [ $1 == "build" ]; then
    build
elif [ $1 == "check" ]; then
    check
elif [ $1 == "clean" ]; then
    clean
elif [ $1 == "new" ]; then
    new $2
fi
