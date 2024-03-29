if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings

fish_add_path ~/.cargo/bin/

starship init fish | source
[ -s "/Users/shota-tsuji/.jabba/jabba.fish" ]; and source "/Users/shota-tsuji/.jabba/jabba.fish"
