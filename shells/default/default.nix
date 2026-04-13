{
  packwiz,
  mkShell,
  ...
}:

mkShell {
  packages = [ packwiz ];
}
