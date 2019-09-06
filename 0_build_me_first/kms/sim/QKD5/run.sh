# master / slave 구분 없이 동작
# -e 0 : 에러 없음 -e n : 메시지 n 번에 하나씩 에러 발생
# -r n : regi 요청을 n 번 무시한 후 응답 한다.
# -a n : keepalive 요청을 n 번 무시한 후 응답 한다.
# [-o home path]  [-p provision ] [-q qkd key ] [-c ssl cert] [-k ssl key ] [-l log level] [-e error repeat] [-r ignore regi] [-a ignore keepalive] [-h]
#
# master org
# update kms_node set node_ip='192.168.11.10', node_port=60011 where node_id=3
#
# master sim
# update kms_node set node_ip='192.168.11.50', node_port=60021 where node_id=3
#
# slave org
# update kms_node set node_ip='192.168.11.20', node_port=60012 where node_id=3
#
# slaver sim
# update kms_node set node_ip='192.168.11.50', node_port=60022 where node_id=3
#
# arm master org
# update kms_node set node_ip='192.168.11.10', node_port=60011 where node_id=3
# arm master smi
# update kms_node set node_ip='192.168.85.162', node_port=60031 where node_id=3
# arm slave org
# update kms_node set node_ip='192.168.11.20', node_port=60012 where node_id=3
# arm slave smi
# update kms_node set node_ip='192.168.85.162', node_port=60032 where node_id=3
#./sim_qkd_skt -l 1  &
./sim_qkd_skt5 -l 1 &
