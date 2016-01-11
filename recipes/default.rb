#
# Cookbook Name:: smart_db_backup
# Recipe:: default
#

directory '/etc/smart_db_backup' do
  mode '750'
end

cookbook_file '/usr/local/bin/smart_db_backup' do
  source 'smart_db_backup'
  mode '750'
end

cookbook_file '/usr/local/bin/smart_db_backup_dump' do
  source 'smart_db_backup_dump'
  mode '750'
end
