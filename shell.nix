# Run with nix-shell
# More info in the structure of this file in the [docs](https://nix.dev/manual/nix/2.18/command-ref/nix-shell)
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Specify the exact packages you want in the environment
  buildInputs = with pkgs; [
  	git 			# Basic
    pre-commit      # Pre-commit hooks framework
    nodejs          # Node.js runtime
    nodePackages.typescript  # TypeScript compiler (tsc)
    awscli2         # AWS CLI v2
    python3Packages.pip    # pre-commit-hooks # Not goint to be available. Add pip and run it in the shellHook instead ;-)
  ];


  # Optional: Environment variables or shell hooks
  shellHook = ''
    echo "Entering development environment with:"
    echo " - git $(git --version)"
    echo " - pre-commit $(pre-commit --version)"
    echo " - Node.js $(node --version)"
    echo " - TypeScript $(tsc --version)"
    echo " - AWS CLI $(aws --version)"
    echo " Installing pre-commit-hooks..."
    pre-commit install
	echo " Done! All should be ready!"
  '';
}
