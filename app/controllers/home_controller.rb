require 'server_updater'

class HomeController < ApplicationController
  def index
    ServerUpdater.new("aaa")
  end

  def self.test
    puts 'testaaa'
  end
end
