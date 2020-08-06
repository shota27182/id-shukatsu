namespace :analytics do
  desc 'import day uniq view'
  task :update_day_pageview_from_ga => :environment do

    view_id = ENV['GOOGLE_ANALYTICS_VIEW_ID']
    ga = Analytics.new(view_id)
    report = ga.get_uniq_pageview('30DaysAgo', 'yesterday')

    pageview = Article.ids.map{|m| [m, 0]}.to_h
    pageview.merge(report)

    ActiveRecord::Base.transaction do
      pageview.each do |k, v|
        if article = Article.find(k)
          article.update!(day_pageview: v)
        end
      end
    end

    Rails.logger.info '閲覧数を更新しました'
  rescue => e
    Rails.logger.error '閲覧数更新に失敗しました'
    Rails.logger.error e.backtrace.join("\n")
  end
end
