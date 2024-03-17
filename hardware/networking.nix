{
  # Networking configuration
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
}
