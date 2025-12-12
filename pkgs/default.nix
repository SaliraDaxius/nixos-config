{
  pkgs,
  ...
}:
{
  monado-start = pkgs.callPackage ./monado-start { };
}