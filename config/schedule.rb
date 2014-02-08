# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron


every 2.minutes do
  puts "Scheduler working!!!!!!"
  #ServerUpdater.new("aaaa").update_all
   #runner "HomeController.index"
  puts "Runned!!!!!!"
end

set :output, {:error => 'error.log', :standard => 'cron.log'}

# Example:
#
#set :output, "crone.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
