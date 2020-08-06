env :PATH, ENV['PATH']

every 1.day, at: '0:10 am' do
  rake "rails analytics:update_day_pageview_from_ga"
end

every 1.days, at: '9:00 am' do

# Rails内のメソッド実行
  runner "EventSchedule.create_notification"
end