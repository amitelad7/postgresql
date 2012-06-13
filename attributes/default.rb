#
# Cookbook Name:: postgresql
# Attributes:: postgresql
#
# Copyright 2008-2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case platform
when "debian"

  if platform_version.to_f == 5.0
    default[:postgresql][:version] = "8.3"
  elsif platform_version =~ /squeeze/
    default[:postgresql][:version] = "8.4"
  end

  set[:postgresql][:dir] = "/etc/postgresql/#{node[:postgresql][:version]}/main"

when "ubuntu"

  case
  when platform_version.to_f <= 9.04
    default[:postgresql][:version] = "8.3"
  when platform_version.to_f <= 11.04
    default[:postgresql][:version] = "8.4"
  else
    default[:postgresql][:version] = "9.1"
  end

  set[:postgresql][:dir] = "/etc/postgresql/#{node[:postgresql][:version]}/main"

when "fedora"

  if platform_version.to_f <= 12
    default[:postgresql][:version] = "8.3"
  else
    default[:postgresql][:version] = "8.4"
  end

  set[:postgresql][:dir] = "/var/lib/pgsql/data"

when "redhat","centos","scientific","amazon"

  default[:postgresql][:version] = "8.4"
  set[:postgresql][:dir] = "/var/lib/pgsql/data"

when "suse"

  if platform_version.to_f <= 11.1
    default[:postgresql][:version] = "8.3"
  else
    default[:postgresql][:version] = "8.4"
  end

  set[:postgresql][:dir] = "/var/lib/pgsql/data"

else
  default[:postgresql][:version] = "8.4"
  set[:postgresql][:dir]         = "/etc/postgresql/#{node[:postgresql][:version]}/main"
end


default[:postgresql][:access_method] = "md5"
default[:postgresql][:listen_address] = "localhost"
default[:postgresql][:max_connections] = 100

default[:postgresql][:shared_buffers] = "24MB"
default[:postgresql][:effective_cache_size] = "128MB"
default[:postgresql][:work_mem] = "1MB"
default[:postgresql][:checkpoint_segments] = 3
default[:postgresql][:wal_buffers] = "64kB"

default[:postgresql][:default_statistics_target] = 10
default[:postgresql][:synchronous_commit] = "on"
default[:postgresql][:statement_timeout] = 0

default[:postgresql][:log_line_prefix] = '%t '
default[:postgresql][:log_min_duration_statement] = -1
default[:postgresql][:logging_collector] = "off"

default[:postgresql][:lc_messages] = 'en_US.UTF-8'
default[:postgresql][:lc_monetary] = 'en_US.UTF-8'
default[:postgresql][:lc_numeric] = 'en_US.UTF-8'
default[:postgresql][:lc_time] = 'en_US.UTF-8'
