# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "luminositylabsllc/bento-ubuntu-22.04-arm64"
  config.vm.box_check_update = false

  config.vm.provider "parallels" do |prl|
    prl.cpus = 10
    prl.memory = 8192
    prl.linked_clone = false
    prl.customize ["set", :id, "--device-set", "hdd0", "--size", "120G", "--no-fs-resize"]
    prl.customize ["set", :id, "--sync-host-printers", "off"]
    prl.customize ["set", :id, "--device-set", "sound0", "--disable", "--disconnect"]
    prl.update_guest_tools = true
  end

  config.vm.provision "shell", inline: <<-SHELL
    sed -i -e 's,deb http,deb [arch=arm64] http,g' /etc/apt/sources.list
    dpkg --add-architecture amd64
    cat > /etc/apt/sources.list.d/amd64.list <<EOF
deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse
deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse
deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
deb [arch=amd64] http://archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse
EOF

  apt-get update
  apt-get install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm python3-subunit mesa-common-dev zstd liblz4-tool
  apt-get install -y git vim-nox
  apt-get install -y qemu-system-x86 qemu-user-binfmt libc6:amd64 zlib1g:amd64 libstdc++6:amd64 libusb-1.0-0:amd64

  mkdir -p /build
  ln -nsf /vagrant/build/conf /build/conf
  chown vagrant:vagrant /build /build/conf

  growpart /dev/sda 3
  lvextend -l 100%FREE -r /dev/ubuntu-vg/ubuntu-lv

  cat > /home/vagrant/.bash_aliases <<EOF
alias g='git'
alias gap='git add -p'
alias gcm='git commit -m'
alias t='git ls-files | grep'
stty werase undef
bind '\\C-w:unix-filename-rubout'
export EDITOR=vim
EOF
  chown vagrant:vagrant /home/vagrant/.bash_aliases
  echo DONE
  SHELL
end
