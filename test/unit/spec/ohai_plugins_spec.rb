require_relative 'spec_helper'

describe 'rackops_rolebook::ohai_plugins' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['cpu']['total'] = 8
      node.set['public_info']['remote_ip'] = '127.0.0.1'
    end.converge(described_recipe)
  end

  it 'creates /etc/chef/ohai_plugins' do
    expect(chef_run).to create_directory('/etc/chef/ohai_plugins')
  end

  it 'does a git sync' do
    pp Chef::Config
    expect(chef_run).to git_sync("#{Chef::Config[:file_cache_path]}/ohai_plugins")
  end

  it 'reloads ohai' do
    expect(chef_run).to reload_ohai('reload')
  end

end
