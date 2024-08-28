abbr -a cfs chafa -f symbols
alias sys-rebuild="sudo nixos-rebuild switch --flake ~/nix-configs/#myNixos"
alias home-rebuild="home-manager switch --flake ~/nix-configs/#hapu@nixos"

atuin init fish | source
zoxide init fish | source
