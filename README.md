# shell-utils

A sets of utils to deploy my environment fasts and easily

Only supported Debian/Ubuntu

## Supported utils

| Tool             | Command    | status | description                                                                                                              |
| ---------------- | ---------- | ------ | ------------------------------------------------------------------------------------------------------------------------ |
| shell-utils-init | sui.sh     | WIP    | Init shell utils                                                                                                         |
| idf-tool         | idft.sh    | OK     | ESP-IDF tool, include build project, create project, clean project                                                       |
| golang-tool      | got.sh     | WIP    | Golang tool, include set up Golang development environment, create new project                                           |
| zsh-tool         | zsht.sh    | WIP    |                                                                                                                          |
| normal-tool      | normalt.sh | WIP    | Install development tools, such as GCC, GNU make, CMake. (Normally, the package `build-essential` already included them) |

## How to use them?

Following those steps, they will help you to finish it.

```bash
git clone https://github.com/SUIBING112233/shell-utils.git ~/shell-utils
```

If zsh, you should edit `.zshrc` file; If bash, you should edit `.bashrc`.

Add those to the end of file.

```
export PATH=$PATH:~/shell-utils/bin
```

OK, done it.
