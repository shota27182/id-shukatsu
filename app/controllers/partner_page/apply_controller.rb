class PartnerPage::ApplyController < ApplicationController
  before_action :logged_in_company
  layout 'application4.html.erb'
  def index
  end
end
