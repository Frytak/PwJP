{
    description = "";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
        flake-parts.url = "github:hercules-ci/flake-parts";
    };

    outputs =
        inputs@{ self, flake-parts, ... }:
        flake-parts.lib.mkFlake { inherit inputs; } {
            systems = [
                "x86_64-linux"
                "aarch64-linux"
                "aarch64-darwin"
                "x86_64-darwin"
            ];

            imports = [ ];

            perSystem =
                {
                    config,
                    self',
                    inputs',
                    pkgs,
                    final,
                    system,
                    ...
                }:
                {
                    devShells.default = pkgs.mkShell {
                        name = "PwJP";

                        packages = with pkgs; [
                            python312
                            jupyter
                            python312Packages.python-lsp-server
                        ];
                    };
                };

            flake = {
                homeModules.default =
                    { config, pkgs, ... }:
                    {
                        imports = [ ];
                    };
            };
        };
}
