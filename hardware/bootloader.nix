{
  # Configure GRUB
  boot.loader.grub = {
    enable = true;

    # Define on which disk you want to install Grub.
    device = "/dev/sda";
  };
}
