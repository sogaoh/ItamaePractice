%w{
  epel-release
  libffi-devel
  gcc
  openssl
  openssl-devel
  python-devel
  libcurl-devel
}.each do |pkg|
  package pkg
end

execute 'install ansible' do
  command <<-EOL
    yum install -y --enablerepo=epel python-pip
    pip install --upgrade pip
    pip install ansible
    pip install --upgrade ansible
  EOL
  user 'root'
end