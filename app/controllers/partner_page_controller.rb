class PartnerPageController < ApplicationController
  layout 'application4.html.erb'
  
  def index
  end
  
  def profile
    @company = Company.find(current_company.id)
  end
end
