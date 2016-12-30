require 'spec_helper'

describe command('fab -V') do
  its(:stdout) { should contain('Fabric 1.13.1') }
end
