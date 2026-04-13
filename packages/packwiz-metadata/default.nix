{ stdenvNoCC, namespace, ... }: stdenvNoCC.mkDerivation {
  pname = "${namespace}-packwiz-metadata";
  version = "1.4.0";
  src = ./src;
  buildPhase = ''
    mkdir $out
    cp -r --no-preserve=all $src/* $out
    chmod -R +r $out/**
  '';
}
