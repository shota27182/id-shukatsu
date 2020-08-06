every 1.day, at: '0:10 am' do
  rake "rails analytics:update_day_pageview_from_ga"
end