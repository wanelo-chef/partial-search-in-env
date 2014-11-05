require 'chef/recipe'

describe 'partial_search_in_env::test_recipe' do
  let(:node1) { [ 'bacon', { name: 'bacon' } ] }
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node, server|
      server.create_node(*node1)
    end.converge(described_recipe)
  end

  it 'includes the partial_search recipe' do
    expect(chef_run).to include_recipe('partial_search::default')
  end

  it 'calls the original partial search method with the expected argument' do
    expect_any_instance_of(Chef::Recipe).to receive(:partial_search).with(:node, '*:* AND environment:_default', {}).and_return(node1)
    chef_run
  end
end
