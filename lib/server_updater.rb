
class ServerUpdater
  attr_accessor :servers

  def initialize(servers = nil)
    puts "aaaa"
    #@servers = servers || Server.all
  end

  def update_all
    puts "aaaa"
    #servers.find_each { |server| server.update_info }
  end
end