require 'spec_helper'

describe command('cstream -V') do
  its(:stdout) { should contain('3.1.1') }
end
