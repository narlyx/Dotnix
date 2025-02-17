{
  programs.librewolf = {
    enable = true;
    settings = {
      "identity.fxaccounts.enable" = true;
      "privacy.resistFingerprinting" = false;
    };
  };
}
