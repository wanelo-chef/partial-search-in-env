module Wanelo
  # To be safe, append the environment to all searches. By convention, we currently do
  # not look for nodes only within our current environment, as we are using different opscode
  # organizations to logically separate all of the nodes. Should this ever change, we would
  # suddenly begin returning nodes from the wrong environment.
  module PartialSearchInEnv
    def partial_search_with_env(type, query = '*:*', args = {}, &block)
      query += " AND environment:#{node.environment}"
      partial_search(type, query, args, &block)
    end
  end
end

Chef::Recipe.send :include, Wanelo::PartialSearchInEnv
