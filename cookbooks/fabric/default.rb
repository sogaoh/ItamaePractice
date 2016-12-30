%w{
  gcc
  python-devel
  python-setuptools
}.each do |pkg|
  package pkg
end

execute 'install fabric' do
  command <<-EOL
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
    python get-pip.py
    pip install fabric
  EOL
  user 'root'
end