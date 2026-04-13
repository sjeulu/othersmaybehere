{ nushell, writeText, writeShellApplication, inputs, system, ... }:

let
  script = writeText "rebuild-packwiz-endpoint.nu"
    (builtins.readFile ./rebuild-packwiz-endpoint.nu)
  ;
in

writeShellApplication {
  name = "rebuild-packwiz-endpoint";
  runtimeInputs = [ nushell  ];
  text = ''
    nu \
      ${script} \
      ${inputs.self.packages.${system}.packwiz-metadata} \
      "$@"
  '';
}
