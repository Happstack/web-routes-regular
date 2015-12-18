{ mkDerivation, base, parsec, regular, stdenv, text, web-routes }:
mkDerivation {
  pname = "web-routes-regular";
  version = "0.19.0.1";
  src = ./.;
  libraryHaskellDepends = [ base parsec regular text web-routes ];
  description = "portable, type-safe URL routing";
  license = stdenv.lib.licenses.bsd3;
}
