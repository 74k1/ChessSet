{ lib, inputs, outputs, pkgs, stdenvNoCC, ... }:

stdenvNoCC.mkDerivation rec {
  pname = "ChessSet";
  version = "v0.1";

  #src = builtins.fetchurl {
  #  url = "https://github.com/74k1/ChessSet/releases/download/${version}/ChessSet-${version}.otf";
  #  sha256 = "sha256-1e3091e24cd544c4dc12fe9b16ce368856dd0a80aa024621374eedeb4d283348=";
  #};

  src = ./..;

  installPhase = ''
    runHook preInstall

    #mkdir -p $out/share/fonts/opentype
    #cp *.otf $out/share/fonts/opentype

    install -D -m444 -t $out/share/fonts/opentype $src/*.otf

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/74k1/ChessSet";
    description = "A pixelated Chess Symbols Font.";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ 74k1 ];
  };
}
