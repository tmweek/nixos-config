{ pkgs, user, ... }:

{
  programs.firefox = {
    enable = true;

    languagePacks = [ "en-US" ];

    policies = {

      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      DisableBuiltinPDFViewer = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableForgetButton = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisableSetDesktopBackground = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisableFormHistory = true;
      DisablePasswordReveal = true;

      BlockAboutConfig = false;
      BlockAboutProfiles = true;
      BlockAboutSupport = true;

      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = false;
      OfferToSaveLogins = false;
      DefaultDownloadDirectory = "/home/${user}/Downloads";

      ExtensionSettings =
        let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in
        {
          "*".installation_mode = "blocked";

          "uBlock0@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            updates_disabled = true;
          };

          "{446900e4-71c2-419f-a6a7-df9fe232a208}" = {
            install_url = moz "bitwarden-password-manager";
            installation_mode = "force_installed";
            updates_disabled = true;
          };

          "jid1-MnnGtVisualBl予測@jetpack" = {
            install_url = moz "privacy-badger17";
            installation_mode = "force_installed";
            updates_disabled = true;
          };

          "addon@darkreader.org" = {
            install_url = moz "darkreader";
            installation_mode = "force_installed";
            updates_disabled = true;
          };
        };
    };

    profiles.default.settings = {
      "privacy.firstparty.isolate" = true;
      "privacy.trackingprotection.enabled" = true;
      "privacy.trackingprotection.socialtracking.enabled" = true;
      "privacy.resistFingerprinting" = true;
      "privacy.donottrackheader.enabled" = true;
      "dom.event.clipboardevents.enabled" = false;
      "privacy.partition.network_state" = true;
      "dom.security.https_only_mode" = true;
      "browser.privatebrowsing.force_media_memory_cache" = true;

      "datareporting.healthreport.uploadEnabled" = false;
      "datareporting.policy.dataSubmissionEnabled" = false;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.archive.enabled" = false;
      "browser.ping-centre.telemetry" = false;

      "network.stricttransportsecurity.preloadlist" = true;
      "security.insecure_connection_icon.enabled" = true;
      "security.mixed_content.block_relevant_content" = true;
      "network.http.referer.XOriginTrimmingPolicy" = 2;
      "network.prefetch-next" = false;
      "network.dns.disablePrefetch" = true;

      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "extensions.pocket.enabled" = false;
      "identity.fxaccounts.enabled" = false;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.compactmode.show" = true;
      "browser.uidensity" = 1;

      "browser.aboutConfig.showWarning" = false;
      "browser.search.suggest.enabled" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.urlbar.trending.featureGate" = false;
      "browser.formfill.enable" = false;
    };
  };
}
