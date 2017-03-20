%w{
  wget
  gcc
}.each do |pkg|
  package pkg
end

execute "download cstream source" do
  cwd "/tmp"
  command <<-EOL
    wget https://www.cons.org/cracauer/download/cstream-3.1.1.tar.gz
    tar xf cstream-3.1.1.tar.gz
  EOL
  user 'root'
  not_if "test -e /usr/local/bin/cstream"
end

execute "build cstream binary" do
  cwd "/tmp/cstream-3.1.1"
  command <<-EOL
    ./configure --prefix=/usr/local
    make
    make install
  EOL
  user 'root'
  not_if "test -e /usr/local/bin/cstream"
end

execute "install cstream post-process" do
  cwd "/tmp"
  command "rm -rf cstream*"
  user 'root'
end