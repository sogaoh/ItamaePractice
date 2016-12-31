%w{
  java-1.8.0-openjdk
  jenkins
}.each do |pkg|
  package pkg
end

service "jenkins" do
  action [:enable, :start]
end