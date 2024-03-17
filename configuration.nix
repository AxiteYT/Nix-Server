{ config, lib, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware/hardware-configuration.nix

    # QEMU
    ./hardware/qemu.nix

    # Home Manager
    ./home/default.nix

    # Networking
    ./hardware/networking.nix

    # Import static variables  
    # SIKE, haven't looked into the best way to do this, this looks nice(ish) tho: https://www.reddit.com/r/NixOS/comments/wzsz4k/comment/im4crke/?utm_source=share&utm_medium=web2x&context=3
  ];

  # Set the time zone.
  time.timeZone = "Australia/Sydney";

  # Define user account
  users.users.hostname = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # Packages
  environment.systemPackages = with pkgs; [ nixfmt ];

  system.stateVersion = "23.11";

}
