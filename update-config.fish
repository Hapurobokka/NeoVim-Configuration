#!/usr/bin/env fish

git add -A 

if test -z $argv
    git commit -m "updating config $(date)"
else
    git commit -m "$argv $(date)"
end

git push

pushd ~/nix-configs 
sudo nix flake update
home-manager switch --flake ~/nix-configs/#hapu@nixos
popd
