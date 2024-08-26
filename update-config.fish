git add -A 
if test -z $argv
    git commit -m "updating config"
else
    git commit -m "$argv"
end
git push
pushd ~/nix-configs 
sudo nix flake update
home-manager switch --flake ~/nix-configs/#hapu@nixos
popd
