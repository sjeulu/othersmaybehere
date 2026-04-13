{ stdenvNoCC, namespace, ... }: stdenvNoCC.mkDerivation {
  name = "${namespace}-prism-instance";
  src = ./src;
  buildPhase = ''
    mkdir $out
    cp -r --no-preserve=all $src/* $out
    chmod -R +r $out/**

    mkdir $out/minecraft
  '';
}
