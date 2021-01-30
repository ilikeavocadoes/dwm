{ stdenv, libXft, libXinerama }:

stdenv.mkDerivation rec {
  name = "dwm";
  src = ./.;
  buildInputs = [ libXft libXinerama ];
  prePatch = ''sed -i "s:/usr/local:$out:" config.mk'';
}
