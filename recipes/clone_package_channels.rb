#
# Cookbook Name:: spacewalk-nativex
# Recipe:: clone_package_channels
#
# Copyright 2014, NativeX
#
# All rights reserved - Do Not Redistribute
#

gems = %w{
  net-ssh
  net-sftp
}

gems.each do |gem|
  gem_package gem do
    action :install
  end
end

template '/usr/local/bin/channel_cloner.rb' do
  action :create
  source 'channel_cloner.erb'
  mode '0755'
end

creds = Chef::EncryptedDataBagItem.load('credentials', 'spacewalk-server')
email = node['spacewalk-nativex']['email']
excludes = node['spacewalk-nativex']['excludes']
node['spacewalk-nativex']['update_prod'] ? update_prod = ' --update-prod' : update_prod = ''
node['spacewalk-nativex']['backup_prod'] ? backup_prod = ' --backup-prod' : backup_prod = ''

# Run channel update on the 3rd Tuesday of every month
cron 'clone_package_channels' do
  action :create
  command "[ `date +%a` = 'Mon' ] && /usr/local/bin/channel_cloner.rb -u #{creds['satellite_username']} "\
    "-p \"#{creds['satellite_password']}\" -l -q -e #{email} -x #{excludes}#{update_prod}#{backup_prod}"
  day '15-21'
  hour '2'
  minute '0'
end
