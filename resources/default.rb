default_action :create

attribute :name,
          [String, Symbol],
          required: true

attribute :db_type,
          [:mysql, 'mysql', :postgresql, 'postgresql', :mongodb, 'mongodb'],
          required: true

attribute :cron_minute,
          [String, Integer],
          default: lazy { get_default(:cron_minute) }

attribute :cron_hour,
          [String, Integer],
          default: lazy { get_default(:cron_hour) }

attribute :cron_weekday,
          [String, Integer],
          default: lazy { get_default(:cron_weekday) }

attribute :cron_month,
          [String, Integer],
          default: lazy { get_default(:cron_month) }

attribute :dbnames,
          String,
          default: lazy { get_default(:dbnames) }

attribute :dbexclude,
          String,
          default: lazy { get_default(:dbexclude) }

attribute :dbuser,
          [String, Symbol],
          default: lazy { get_default(:dbuser) }

attribute :dir,
          String,
          default: lazy { get_default(:dir) }

attribute :dir_permission,
          [String, Integer],
          default: lazy { get_default(:dir_permission) }

attribute :file_permission,
          [String, Integer],
          default: lazy { get_default(:file_permission) }

attribute :compression,
          [String, Symbol],
          default: lazy { get_default(:compression) }

attribute :global,
          [String, TrueClass, FalseClass],
          default: lazy { get_default(:global) }

attribute :host,
          String,
          default: lazy { get_default(:host) }

attribute :port,
          [String, Integer],
          default: lazy { get_default(:port) }

attribute :password,
          [String],
          default: lazy { get_default(:password) }

attribute :group,
          [String, Symbol],
          default: lazy { get_default(:group) }

attribute :owner,
          [String, Symbol],
          default: lazy { get_default(:owner) }

attribute :runas,
          [String, Symbol],
          default: lazy { get_default(:runas) }

attribute :keep_lasts,
          [String, Integer],
          default: lazy { get_default(:keep_lasts) }

attribute :keep_days,
          [String, Integer],
          default: lazy { get_default(:keep_days) }

attribute :keep_weeks,
          [String, Integer],
          default: lazy { get_default(:keep_weeks) }

attribute :keep_months,
          [String, Integer],
          default: lazy { get_default(:keep_months) }

attribute :keep_logs,
          [String, Integer],
          default: lazy { get_default(:keep_logs) }

attribute :sock_paths,
          [String],
          default: lazy { get_default(:sock_paths) }

def get_default(attribute)
  # User can override values per DB type, superior to global values
  if node['smart_db_backup'][self.db_type.to_s]
    superior_value = node['smart_db_backup'][self.db_type.to_s][attribute.to_s]

    return superior_value if superior_value
  end

  node['smart_db_backup'][attribute.to_s]
end

# MySQL specific
action :create do
  config_file_path = "/etc/smart_db_backup/#{new_resource.name}.conf"

  pass_attributes_to_template = %w(
    db_type dbnames dbexclude dbuser dir dir_permission
    file_permission compression global host port password group owner runas keep_lasts
    keep_days keep_weeks keep_months keep_logs sock_paths
  )

  template config_file_path do
    cookbook 'smart_db_backup'
    source 'config.erb'

    attributes = pass_attributes_to_template.each_with_object({}) do |attr, acc|
      acc[attr] = new_resource.public_send(attr)
    end

    variables(attributes)
  end

  cron "smart_backup_db_#{new_resource.name}" do
    command "/usr/local/bin/smart_db_backup #{config_file_path} > /dev/null"

    minute    (new_resource.cron_minute  || node['smart_db_backup']['cron_minute'])
    hour      (new_resource.cron_hour    || node['smart_db_backup']['cron_hour'])
    weekday   (new_resource.cron_weekday || node['smart_db_backup']['cron_weekday'])
    month     (new_resource.cron_month   || node['smart_db_backup']['cron_month'])
  end
end

action :delete do
  config_file_path = "/etc/smart_db_backup/#{new_resource.name}.conf"

  file config_file_path do
    action :delete
  end

  cron "smart_backup_db_#{db_type}" do
    action :delete
  end
end
