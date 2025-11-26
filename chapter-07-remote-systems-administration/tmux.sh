#!/bin/bash 
# Copiright Pablo Iranzo

SESSION=$USER 
tmux -2 new-session -d -s $SESSION # create new session 
tmux select-window -t $SESSION:0  # select first window 
tmux rename-window -t $SESSION "monitoring" #rename to monitoring 
tmux split-window -h #split horizontally 
tmux split-window -v #split vertically 
tmux split-window -h # split again horizontally 
tmux select-layout tiled #tile panes 
tmux selectp -t1 # select pane 1 
tmux send-keys "top" C-m #run top by sending the letters + RETURN 
tmux selectp -t2 # select pane 2 
tmux send-keys "journalctl -f" C-m # run journalctl 
tmux selectp -t3 # select pane 3 
tmux send-keys "iostat -x" C-m # run iostat 
tmux selectp -t0 #select the pane without commands executed 
