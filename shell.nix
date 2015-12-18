{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, parsec, regular, stdenv, text
      , web-routes
      }:
      mkDerivation {
        pname = "web-routes-regular";
        version = "0.19.0.1";
        src = ./.;
        libraryHaskellDepends = [ base parsec regular text web-routes ];
        description = "portable, type-safe URL routing";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
