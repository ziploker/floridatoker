#!/bin/bash
echo "this is a journey into SPACE."
cd /home/amsterdam/workspace/florida
gnome-terminal -x bash -c BASH_POST_RC='ls' gnome-terminal
  
#cd /home/amsterdam/workspace/florida
#gnome-terminal --tab -e "bash -c 'bundle exec rails s'" --tab


# && pwd && gnome-terminal -c "rails s" & sleep 4 && subl && xdg-open "http://localhost:3000"