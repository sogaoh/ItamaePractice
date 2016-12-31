%w{
  java-1.8.0-openjdk
}.each do |pkg|
  package pkg
end

execute 'install jenkins' do
  command <<-EOL
    wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-$ stable/jenkins.repo
    rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
    yum install jenkins
  EOL
  user 'root'
end

service "jenkins" do
  action [:enable, :start]
end