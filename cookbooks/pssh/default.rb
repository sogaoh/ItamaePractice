%w{
  python-setuptools
  rsync
}.each do |pkg|
  package pkg
end

execute 'install pssh' do
  command <<-EOL
    yum install -y --enablerepo=epel pssh
  EOL
  user 'root'
end

execute 'symlink pscp' do
  command "ln -snf pscp.pssh pscp"
  cwd "/usr/bin"
  user 'root'
end