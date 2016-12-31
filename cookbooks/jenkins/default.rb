%w{
  java-1.8.0-openjdk
}.each do |pkg|
  package pkg
end

execute "download repo" do
  command "wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo"
  user 'root'
  not_if "test -e /etc/yum.repos.d/jenkins.repo"
end

execute "import jenkins key" do
  command "rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key"
  user 'root'
end

package "jenkins" do
  action :install
end

execute 'firewall setting' do
  command <<-EOL
    firewall-cmd --add-port=8080/tcp --permanent
    firewall-cmd --add-service=http --permanent
    firewall-cmd --reload
  EOL
  user 'root'
end

service "jenkins" do
  action [:enable, :start]
end