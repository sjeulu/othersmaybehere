{ nushell, writeText, writeShellApplication, inputs, system, ... }:

let
  name = "rebuild-packwiz-endpoint";
  script = writeText "${name}.nu"
    (builtins.readFile ./rebuild-packwiz-endpoint.nu)
  ;
in

writeShellApplication {
  inherit name;
  runtimeInputs = [ nushell  ];
  text = ''
    nu \
      ${script} \
      ${inputs.self.packages.${system}.packwiz-metadata} \
      "$@"
  '';
}
