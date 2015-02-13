# Clones/Merges Dev channel packages into Prod channel
default["spacewalk-nativex"]["update_prod"] = true
# Backs up Prod channel before cloning/merging Dev packages
default["spacewalk-nativex"]["backup_prod"] = true
# Channel activation key specifies which channel the client should be registered with
default["spacewalk-nativex"]["activation_key"] = '1-centos6'
# Excludes cloning packages for channel IDs specified, use "," to separate channels, exclude the dev-- or prod-- prefix
default["spacewalk-nativex"]["excludes"] = 'dsc-centos,dse-centos'
# Email address to send channel cloner script results to
default["spacewalk-nativex"]["email"] = 'root.linux@nativex.com'