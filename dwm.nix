{ config, lib, pkgs, ... }:

with lib;

{
  services.xserver.windowManager.session = singleton {
    name = "dwm";
    start = ''
      dwm &
      waitPID=$!
    '';
  };

  environment.systemPackages = [ (pkgs.callPackage ./derivation.nix {}) ];
}
