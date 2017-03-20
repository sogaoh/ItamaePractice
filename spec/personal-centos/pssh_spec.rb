require 'spec_helper'

describe command('pssh --version') do
  its(:stdout) { should contain('2.3.1') }
end
