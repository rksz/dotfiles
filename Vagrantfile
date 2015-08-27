Vagrant.configure(2) do |config|
# config.vm.box = "chef/centos-7.0"
# config.vm.box = "centos64_ja"
  config.vm.box = "centos7"
  config.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"
  config.vm.define :"localnode-01" do |node|
    node.vm.network :private_network, ip: '192.168.33.22'
    node.vm.provision "shell", inline: <<-EOT
      setenforce 0
      sed -ri 's/SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
    EOT
    node.vm.synced_folder "~/Desktop/", "/desktop", \
      :create        => true, \
      :owner         => 'vagrant', \
      :group         => 'vagrant', \
      :mount_options => ['dmode=777,fmode=777']
    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
  end
end
