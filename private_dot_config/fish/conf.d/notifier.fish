function tn
    set cmd (string join ' ' $argv)
    eval $cmd \
        ; and terminal-notifier -title "Done!" -message "$cmd" \
        ; or  terminal-notifier -title "Failed..." -message "$cmd"
end
