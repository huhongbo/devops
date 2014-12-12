#
# Cookbook Name:: user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
group "zsh" do
   group_name "zsh"
   gid "2000"
end

user "zsh" do
  username "zsh"
  comment "Random User"
  uid 2000
  gid "2000"
  home "/home/zsh"
  shell "/bin/bash" 
end

execute "zsh" do
  command "echo zsh | passwd --stdin zsh"
end