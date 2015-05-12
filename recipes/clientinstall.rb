#
# Cookbook Name:: spacewalk-simplyadrian
# Recipe:: clientinstall
#
# Copyright 2014, simplyadrian
#
# All rights reserved - Do Not Redistribute
#

%w{rhn-client-tools rhn-check rhn-setup rhnsd m2crypto yum-rhn-plugin}.each do |pkg|
  package pkg do
    action :install
    options "--nogpgcheck"
  end
end
