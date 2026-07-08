{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      # tex = pkgs.texliveBasic.withPackages (
      #   ps: with ps; [
      #     latexmk
      #     babel
      #   ]
      # );
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # tex
          (texliveBasic.withPackages (
            ps: with ps; [
              latexmk
              babel
              babel-spanish
              xcolor
              amsmath
              hyperref
              booktabs
            ]
          ))
        ];
      };
    };
}
