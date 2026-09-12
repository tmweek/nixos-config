{ ... }:
let
  hasIPv6Internet = false;
  StateDirectory = "dnscrypt-proxy";
in
{
  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      listen_addresses = [ "127.0.0.1:53" ];
      server_names = [ "quad9-dnscrypt-ip4-filter-pri" ];
      bootstrap_resolvers = [
        "9.9.9.9:53"
        "1.1.1.1:53"
      ];

      ipv6_servers = hasIPv6Internet;
      block_ipv6 = !(hasIPv6Internet);

      require_dnssec = true;
      require_nolog = true;

      anonymized_dns = {
        routes = [
          {
            server_name = "quad9-dnscrypt-ip4-filter-pri";
            via = [
              "anon-cs-de"
              "anon-cs-nl"
              "anon-ibksturm"
            ];
          }
        ];
      };
    };
  };

  services.resolved.enable = false;

  networking.nameservers = [
    "127.0.0.1"
    "9.9.9.9"
  ];
  systemd.services.dnscrypt-proxy.serviceConfig.StateDirectory = StateDirectory;
}
