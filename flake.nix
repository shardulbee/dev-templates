{
  description = "Ready-made templates for easily creating flake-driven environments";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

outputs = { self, nixpkgs }: {

  templates.python = {
    path = ./python;
    description = "A simple python project";
    welcomeText = ''
      # Simple Python Template
      ## Intended usage
      The intended usage of this flake is...

      ## More info
    '';
  };

  templates.default = self.templates.python;
  };
}