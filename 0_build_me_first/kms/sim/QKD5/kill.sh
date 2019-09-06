 ps -ef | grep sim_qkd_skt5 | grep -v grep | grep -v vi | grep -v tail | awk '{print $2}' | xargs kill
