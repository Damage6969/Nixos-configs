# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
#################################
# Machine Specific SSH ZFS Boot #
#            Morpheus           #
#################################

{
  boot = {
    initrd.network = {
      # This will use udhcp to get an ip address.
      # Make sure you have added the kernel module for your network driver to `boot.initrd.availableKernelModules`, 
      # so your initrd can load it!
      # Static ip addresses might be configured using the ip argument in kernel command line:
      # https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
      enable = true;
      ssh = {
        enable = true;
        # To prevent ssh clients from freaking out because a different host key is used,
        # a different port for ssh is useful (assuming the same host has also a regular sshd running)
        port = 2222; 
        # hostKeys paths must be unquoted strings, otherwise you'll run into issues with boot.initrd.secrets
        # the keys are copied to initrd from the path specified; multiple keys can be set
        # you can generate any number of host keys using 
        hostKeys = [
          /etc/secrets/initrd/ssh_host_rsa_key
          /etc/secrets/initrd/ssh_host_ed_25519_key
        ];
        # public ssh key used for login
        authorizedKeys = [ "/etc/secrets/initrd/ssh_host_rsa_key.pub" "/etc/secrets/initrd/ssh_host_ed_25519_key.pub" ];
      };
    };
  };
}
