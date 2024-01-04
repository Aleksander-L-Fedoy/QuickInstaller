
# Software Installation Guide for Ubuntu/WSL

This guide provides commands to install various software on Ubuntu/WSL.

*Install VS-code in Windows*

## Haskell
```
sudo apt update
sudo apt install haskell-platform
```

## C / gcc
```
sudo apt update
sudo apt install build-essential
```

## Python
```
# Python is likely already installed. To check version:
python3 --version

# For Python libraries:
sudo apt update
sudo apt install python3-pip
pip3 install pwntools matplotlib pandas
```

## Java
```
sudo apt update
sudo apt install default-jdk
```

## SQL / SQLite
```
sudo apt update
sudo apt install sqlite3
```

## Git
```
sudo apt update
sudo apt install git
```

# Additional Software Recommendations

## Docker
```
sudo apt install docker.io
```

## Node.js and NPM
```
sudo apt install nodejs npm
```

## SSH Client
```
sudo apt install openssh-client
```

Note: For Postman, download and install from [Postman's website](https://www.postman.com/).


## Symbolic links

``` ln -s [target] [link_name] ```

Ex:

``` lin -s /mnt/c/Users/[Username]/Documents Documents ```

