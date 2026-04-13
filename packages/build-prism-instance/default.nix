{
  nushell,
  stdenvNoCC,
  writeText,
  writeShellApplication,
  zip,
  namespace,
  ...
}:

let
  name = "build-prism-instance";
  sources = stdenvNoCC.mkDerivation {
    name = "${namespace}-prism-instance-sources";
    src = ./src;
    buildPhase = ''
      mkdir $out
      cp -r $src/* $out
    '';
  };
  script = writeText "${name}.nu"
    (builtins.readFile ./build-prism-instance.nu)
  ;
in

writeShellApplication {
  inherit name;
  runtimeInputs = [ nushell zip ];
  text = ''nu ${script} ${sources} "$@"'';
}
