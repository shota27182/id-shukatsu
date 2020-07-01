module PartnerUser::SessionsHelper
    def log_in(company)
        session[:company_id] = company.id
    end
    
    def remember(company)
        company.remember
        cookies.permanent.signed[:company_id] = company.id
        cookies.permanent[:remember_token] = company.remember_token
    end
    
    def current_company
        if (company_id = session[:company_id])
            @current_company ||= Company.find_by(id: session[:company_id])
        elsif (company_id = cookies.signed[:company_id])
            company = Company.find_by(id: company_id)
            if company && company.authenticated(:remember, cookies[:remember_token])
                log_in company
                @current_company = company
            end
        end
    end
    
    def logged_in
        !current_company.nil?
    end
    
    def forget(company)
        company.forget
        cookies.delete(:company_id)
        cookies.delete(:remember_token)
    end
    
    def log_out
        forget(current_company)
        session.delete(:company_id)
        @current_company = nil
    end
end
