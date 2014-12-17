# Clones/Merges Dev channel packages into Prod channel
default["spacewalk-nativex"]["update_prod"] = true
# Backs up Prod channel before cloning/merging Dev packages
default["spacewalk-nativex"]["backup_prod"] = true
# Channel activation key specifies which channel the client should be registered with
default["spacewalk-nativex"]["activation_key"] = '1-centos6'