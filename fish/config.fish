function fish_prompt
    set -l last_status $status

    set -l stat 
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end

    string join '' -- (set_color green) (prompt_pwd --full-length-dirs 2) (set_color normal) $stat '>' ' ' 
end

abbr -a cfs chafa -f symbols

alias sys-rebuild="sudo nixos-rebuild switch --flake ~/nix-configs/#myNixos"
alias home-rebuild="home-manager switch --flake ~/nix-configs/#hapu@nixos"

atuin init fish | source
zoxide init fish | source
