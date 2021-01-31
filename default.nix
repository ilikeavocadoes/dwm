{ stdenv, libXft, libXinerama, rofi }:

stdenv.mkDerivation rec {
  name = "dwm";
  src = ./.;
  buildInputs = [ libXft libXinerama ];
  prePatch = ''
    sed -i "s:/usr/local:$out:" config.mk
    substituteInPlace config.def.h --replace "rofi" "${rofi}/bin/rofi"
  '';
}
