require 'google/apis/analyticsreporting_v4'

class Analytics
  def initialize(view_id)
    @view_id  = view_id
    scope = 'https://www.googleapis.com/auth/analytics.readonly'
    json_path = Rails.root.join("app", "lib", "analytics.json") //任意の場所にjsonファイルを配置

    @analytics = Google::Apis::AnalyticsreportingV4
    @client = @analytics::AnalyticsReportingService.new
    @client.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(json_path),
      scope: scope
    )
  end
  def get_uniq_pageview(start_date='2020-08-06', end_date='today')
        date_range = @analytics::DateRange.new(start_date: start_date, end_date: end_date)
        metric     = @analytics::Metric.new(expression: 'ga:uniquePageviews', alias: 'uniquePageviews')
        dimension  = @analytics::Dimension.new(name: 'ga:pagePath')
        order_by   = @analytics::OrderBy.new(field_name: 'ga:uniquePageviews', sort_order: 'DESCENDING')
        dimension_filters = @analytics::DimensionFilterClause.new(
          filters: [
            @analytics::DimensionFilter.new(
              dimension_name: 'ga:pagePath',
              expressions: ['^/articles/\w{20}']
            )
          ]
        )
    
        report_request = @analytics::GetReportsRequest.new(
          report_requests: [
            @analytics::ReportRequest.new(
              view_id: @view_id,
              metrics: [metric],
              date_ranges: [date_range],
              dimension_filter_clauses: [dimension_filters],
              dimensions: [dimension],
              order_bys: [order_by],
            )
          ]
        )
    
        response = @client.batch_get_reports(report_request)
        data = response.reports.first.data
    
        pageview = data.rows&.map{ |row| [ row.dimensions.first.slice(/\w+{20}/), row.metrics.first.values.first ] }.to_h
        return pageview
  end
end