{ stdenvNoCC, namespace, ... }: stdenvNoCC.mkDerivation {
  pname = "${namespace}-packwiz-metadata";
  version = "1.4.0";
  src = ./.;
  buildPhase = ''
    mkdir $out
    cp $src $out -r
  '';
}
