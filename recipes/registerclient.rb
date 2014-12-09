#
# Cookbook Name:: spacewalk-nativex
# Recipe:: registerclient 
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

bash 'register_client' do
  code <<-EOH
    # Try registering client with spacewalk
    rhnreg_ks --serverUrl=http://spacewalk.teamfreeze.com/XMLRPC --activationkey=1-centos6
    
    # Store exit status
    status=$?

    # Test for existing registration
    if 	rhnreg_ks --serverUrl=http://spacewalk.teamfreeze.com/XMLRPC --activationkey=1-centos6 $status -eq 0
    then
     echo 'Node is now  registered with Spacewalk.'
    else 
     echo 'Node is already registered with Spacewalk.'
    fi
  EOH
end
