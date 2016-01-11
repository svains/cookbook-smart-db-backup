default['smart_db_backup']['colorize'] = 'true'
default['smart_db_backup']['compression'] = 'gzip'
default['smart_db_backup']['dir'] = '/var/backup'
default['smart_db_backup']['global'] = 'true'

default['smart_db_backup']['keep_lasts'] = '24'
default['smart_db_backup']['keep_days'] = '7'
default['smart_db_backup']['keep_weeks'] = '35'
default['smart_db_backup']['keep_months'] = '3'
default['smart_db_backup']['keep_logs'] = '60'

default['smart_db_backup']['dir_permission'] = '750'
default['smart_db_backup']['file_permission'] = '640'

default['smart_db_backup']['owner'] = 'root'
default['smart_db_backup']['group'] = 'root'

default['smart_db_backup']['runas'] = 'root'
default['smart_db_backup']['dbuser'] = 'root'
default['smart_db_backup']['password'] = ''
default['smart_db_backup']['host'] = 'localhost'
default['smart_db_backup']['port'] = ''
default['smart_db_backup']['dbnames'] = 'all'
default['smart_db_backup']['dbexclude'] = ''

default['smart_db_backup']['cron_minute'] = '02'
default['smart_db_backup']['cron_hour'] = '02'
default['smart_db_backup']['cron_weekday'] = '*'
default['smart_db_backup']['cron_month'] = '*'

# Elasticserach specific
default['smart_db_backup']['elasticsearch']['uri'] = 'http://localhost:9200'
default['smart_db_backup']['elasticsearch']['user'] = ''
default['smart_db_backup']['elasticsearch']['password'] = ''
# path to snapshots (have to be added to path.repo in elasticsearch.yml)
default['smart_db_backup']['elasticsearch']['snapshots_dir'] = ''

# PostgreSQL specific
default['smart_db_backup']['postgresql']['psql'] = '/usr/bin/psql'
default['smart_db_backup']['postgresql']['pg_dump'] = '/usr/bin/pg_dump'
default['smart_db_backup']['postgresql']['pg_dumpall'] = '/usr/bin/pg_dumpall'
default['smart_db_backup']['postgresql']['opt'] = '--create -Fc'
default['smart_db_backup']['postgresql']['optall'] = '--globals-only'
default['smart_db_backup']['postgresql']['dbuser'] = 'postgres'

# Slapd specific
default['smart_db_backup']['slapd']['args'] = ''
default['smart_db_backup']['slapd']['dir'] = '/var/lib/ldap'

# MySQL specific
default['smart_db_backup']['mysql']['sock_paths'] = ''
default['smart_db_backup']['mysql']['mysql'] = ''
default['smart_db_backup']['mysql']['mysqldump'] = ''
default['smart_db_backup']['mysql']['no_single_transaction'] = ''
default['smart_db_backup']['mysql']['autocommit'] = '1'
default['smart_db_backup']['mysql']['completeinserts'] = '1'
default['smart_db_backup']['mysql']['locktables'] = ''
default['smart_db_backup']['mysql']['debug'] = ''
default['smart_db_backup']['mysql']['noroutines'] = ''
default['smart_db_backup']['mysql']['user_ssl'] = ''

# MongoDB specific
default['smart_db_backup']['mongodb']['path'] = '/var/lib/mongodb'
default['smart_db_backup']['mongodb']['args'] = ''

# Redis specific
default['smart_db_backup']['redis']['path'] = '/var/lib/redis'
