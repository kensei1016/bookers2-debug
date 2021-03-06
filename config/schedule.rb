# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
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
require File.expand_path(File.dirname(__FILE__) + "/environment")

rails_env = ENV['RAILS_ENV'] || :development

# 実行環境を指定する
set :environment, rails_env

# 出力先のログファイル指定
set :output, "#{Rails.root}/log/crontab.log"

every 1.day, at: '18:51 pm' do
  command "echo 'mossmossmossmossmossmoss'"
  runner 'DailyMailer.creation_email.deliver_now'
end