ps -ef | grep sim_enc_restful | grep -v grep | grep -v vi | grep -v tail | awk '{print $2}' | xargs kill 
