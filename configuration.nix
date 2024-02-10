{ config, lib, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./modules/hardware-configuration.nix

    # Import static variables  
    # SIKE, haven't looked into the best way to do this, this looks nice(ish) tho: https://www.reddit.com/r/NixOS/comments/wzsz4k/comment/im4crke/?utm_source=share&utm_medium=web2x&context=3
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hostname = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ nixfmt ];

  # Services
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    openssh.enable = true;
  };

  # Define networking configuration
  networking = {
    hostName = "TODO";
    domain = "axitemedia.com";
    interfaces = {
      enp6s18.ipv4.addresses = [{
        address = "192.168.1.0";
        prefixLength = 24;
      }];
    };
    defaultGateway = "192.168.1.1";
    nameservers = [ "192.168.1.1" ];
  };

  system.stateVersion = "23.11";

}
