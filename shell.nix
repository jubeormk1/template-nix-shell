# Run with nix-shell
# More info in the structure of this file in the [docs](https://nix.dev/manual/nix/2.18/command-ref/nix-shell)
{ pkgs ? import <nixpkgs> {} }:

let
  # Specify the exact packages you want in the environment
  buildInputs = with pkgs; [
  	git 			# Basic
	pre-commit      # Pre-commit hooks framework
	# rustup
	# cargo
	# rustc
	# nodejs
	# typescript
	# awscli2
  ];
in
pkgs.mkShell {
  inherit buildInputs;

  # Optional: Environment variables or shell hooks
  shellHook = ''
    echo "The following tools are available:"
	for pkg in ${toString buildInputs}; do
	  echo " - $(echo $pkg)"
	done
    pre-commit install
	echo " Done! All should be ready!"
  '';
}
