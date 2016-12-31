require 'spec_helper'

describe command('curl -v --silent http://localhost:8080/  2>&1 | grep X-Jenkins:') do
  its(:stdout) { should contain('X-Jenkins: 2.38') }
end
