require 'spec_helper'

describe command('ansible --version') do
  its(:stdout) { should contain('ansible 2.') }
end
