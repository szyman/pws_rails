# https://docs.google.com/a/mobica.com/document/d/1h8n1hQFatpEcaOCnNVVoeASF_Nk4pqqSLalUfusvPZY/edit?usp=sharing

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :environment, :development
set :output, {
    :error => 'log/whenever_error.log',
    :standard => 'log/whenever.log'
}

every 2.minutes do
  puts "Scheduler working!!!!!!"
  runner "NotificationsController.send_notifications"
end

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
