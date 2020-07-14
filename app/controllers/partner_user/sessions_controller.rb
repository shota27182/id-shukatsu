class PartnerUser::SessionsController < ApplicationController
  layout 'application4.html.erb'
  def new
  end
  
  def create
    company = Company.find_by(email: params[:session][:email].downcase)
    company_log_in company
    params[:session][:remember_me] == '1' ? remember(company) : forget(company)
    redirect_to '/partner_page/dashboard'
  end
end
