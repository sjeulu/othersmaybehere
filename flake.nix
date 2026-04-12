{
  inputs = {
    # Infrastructure
    nixpkgs.url = "github:nixos/nixpkgs/master";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.snowfall-lib.mkFlake {
    inherit inputs;
    src = ./.;
    snowfall.namespace = "othersmaybehere";
  };
}
