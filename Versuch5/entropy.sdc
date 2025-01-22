# Disable timing anylsis on entropy|meta_a/b
# There is no way a static timing anylsis can be performed, since we're using the jitter of the PLLs
# to create random data. Therefore we can aswell disable timing anylsis on the specific net. 
# see entropy.vhd for details
set_false_path -through [get_nets {*|entroy|meta_a *|entroy|meta_b}]