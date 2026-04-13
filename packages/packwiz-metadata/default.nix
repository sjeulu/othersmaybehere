{ stdenvNoCC, namespace, ... }: stdenvNoCC.mkDerivation {
  name = "${namespace}-packwiz-metadata";
  src = ./src;
  buildPhase = ''
    mkdir $out
    cp -r --no-preserve=all $src/* $out
    chmod -R +r $out/**
  '';
}
