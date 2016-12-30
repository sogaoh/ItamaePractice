%w{
  gcc
  zlib-devel
  python-devel
  python-setuptools
}.each do |pkg|
  package pkg
end

execute 'install fabric' do
  command <<-EOL
    easy_install pip
    pip install fabric
  EOL
  user 'root'
end