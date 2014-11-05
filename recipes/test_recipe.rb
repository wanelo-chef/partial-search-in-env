#
# Cookbook Name:: partial_search_in_env
# Recipe:: test_recipe
#
# The test_recipe exists only for unit testing. We do this instead of
# relying on ChefSpec to create a fake recipe somewhere... somehow.
#
# Copyright (C) 2014 Wanelo
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'partial_search_in_env::default'

partial_search_in_env(:node)
