# [-o home path]  [-p provision ] [-m operMode  (Master|Slave) ] [-c ssl cert] [-k ssl key ] [-l log level] [-h]
#
# Master org
# update kms_node set node_port=60011 where node_id=1
#
# Master sim
# update kms_node set node_port=70011 where node_id=1
#
# Slave org
# update kms_node set node_port=60012 where node_id=1
#
# Slave sim
# update kms_node set node_port=70012 where node_id=1

./sim_enc_restful -m M  -l 1 &
./sim_enc_restful2 -m S -l 1 &

