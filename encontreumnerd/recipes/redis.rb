#
# Cookbook Name:: encontreumnerd
# Recipe:: redis
#
# Copyright 2014, João Netto
#
# All rights reserved - Do Not Redistribute
#

node[:deploy].each do |application, deploy|
  if node[:redis]
    template "#{deploy[:deploy_to]}/shared/config/redis.yml" do
      source "redis.yml.erb"
      mode 0755
      group deploy[:group]
      owner deploy[:user]

      redis = Hash[node[:redis]]
      variables(
        "redis" => redis
      )
    end
  end
end
