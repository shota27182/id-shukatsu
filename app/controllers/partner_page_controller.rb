class PartnerPageController < ApplicationController
  layout 'application4.html.erb'
  before_action :logged_in_company
  
  def index
  end
  
  def profile
    @company = Company.find(current_company.id)
  end
end
