#
# Cookbook Name:: ipaddr_extensions
# Recipe:: default
#
# Copyright 2013, Wanelo, Inc
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

ohai "reload ip_scopes" do
  action :nothing
  plugin "ip_scopes"
end

chef_gem 'ipaddr_extensions' do
  notifies :reload, 'ohai[reload ip_scopes]', :immediately
end
