VAGRANTFILE_API_VERSION = '2'

# Avoid having to pass --provider=docker
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

# Vagrant config
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # App container
  config.vm.define 'app' do |a|
      a.vm.provider 'docker' do |d|
          d.build_dir = './app'
          #d.build_args = ['-t=go_im']
          d.name = 'app'
          d.vagrant_vagrantfile = './host/Vagrantfile'
          d.ports = ['8000:8080']
          #d.volumes = ['/src/hello:/go/src/hello/']
          #d.cmd = ['go', 'run', '/go/src/hello/hello.go']
          #d.link('redis:redis')
      end
  end

  # Mysql Container
  config.vm.define 'mysql' do |m|
    # Tell Vagrant to use Docker
    m.vm.provider 'docker' do |d|
      # Pull the mysql container from the docker hub
      d.image = 'mysql/mysql-server'      
      # Tell Docker to name the container 'mysql'
      d.name = 'mysql'
      # Assign ports 3306 to the container
      d.ports = ['3306:3306']
      d.env = {
        'MYSQL_ROOT_PASSWORD' => 'sosliveearth'
      }
      # Make sure the container stays running when started
      d.remains_running = true
      # Use the HostVagrantfile settings to provision
      d.vagrant_vagrantfile = './host/Vagrantfile'
      # Build directory that contains DockerFile
      #d.build_dir = './mysql'
    end    
  end

  # RabbitMq Container
  #config.vm.define 'rabbitmq' do |m|
  #  m.vm.provider 'docker' do |d|
  #    d.image = 'rabbitmq'
  #    d.name = 'rabbitmq'
  #    d.ports = ['5672:5672', '15672:15672']
  #    # d.volumes = ['rabbitmq:/etc/rabbitmq']
  #    # d.volumes = ['./rabbitmq/rabbitmq.config:/etc/rabbitmq/rabbitmq.config', './rabbitmq/logs/:/etc/rabbitmq/logs/']      
  #    d.env = {
  #      'RABBITMQ_LOG_BASE' => '/etc/rabbitmq/logs/'
  #    }
  #    d.remains_running = true
  #    d.vagrant_vagrantfile = './host/Vagrantfile'
  #    d.cmd = ['rabbitmq-plugins', 'enable', 'rabbitmq_management']
  #  end
  #  m.vm.synced_folder './rabbitmq', '/etc/rabbitmq/'
  #end

  config.vm.define 'rabbitmq' do |m|
    m.vm.provider 'docker' do |d|
      d.build_dir = './rabbitmq'
      d.ports = ['5672:5672', '15672:15672']
      d.create_args = ['--name', 'rabbitmq-dev']
      d.remains_running = true
      d.vagrant_vagrantfile = './host/Vagrantfile'
    end
    m.vm.synced_folder './rabbitmq/logs', '/var/log/rabbitmq'
  end

end