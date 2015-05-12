#
# Cookbook Name:: spacewalk-simplyadrian
# Recipe:: registerclient 
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

activation_key = node['spacewalk-simplyadrian']['activation_key']

bash 'register_client' do
  code <<-EOH
    # Try registering client with spacewalk
    rhnreg_ks --serverUrl=http://spacewalk.teamfreeze.com/XMLRPC --activationkey=#{activation_key}
    
    # Store exit status
    status=$?

    # Test for existing registration
    if 	rhnreg_ks --serverUrl=http://spacewalk.teamfreeze.com/XMLRPC --activationkey=#{activation_key} $status -eq 0
    then
     echo 'Node is now  registered with Spacewalk.'
    else 
     echo 'Node is already registered with Spacewalk.'
    fi
  EOH
end
