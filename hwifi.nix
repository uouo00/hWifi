{ pkgs ? (import <nixpkgs> {})
, haskellPackages ? pkgs.haskellPackages_ghc784_no_profiling
, networkmanager ? pkgs.networkmanager # nmcli used by hWifi
}:

let
  inherit (haskellPackages) cabal cabalInstall HUnit QuickCheck mtl text; # Haskell dependencies here

in cabal.mkDerivation (self: {
  pname = "hWifi";
  version = "0.0.0.1";
  sha256 = "dummy-sha1-for-the-moment";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  buildTools = [ haskellPackages.cabalInstall networkmanager ];
  buildDepends = with haskellPackages; [ mtl text ];
  testDepends = with haskellPackages; [ HUnit QuickCheck text ];
  meta = {
    homepage = "https://github.com/lambdatree/hWifi.git";
    description = "Wifi connections manager in Haskell";
    license = self.stdenv.lib.licenses.gpl2;
    platforms = self.ghc.meta.platforms;
  };
})
