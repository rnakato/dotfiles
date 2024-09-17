function tn
    tmux new -s $argv
end

function ta
    tmux attach -t $argv
end
