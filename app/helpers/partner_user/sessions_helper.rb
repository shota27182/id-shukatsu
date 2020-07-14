module PartnerUser::SessionsHelper
  def company_log_in(company)
    session[:company_id] = company.id
  end

  # 記憶トークンcookieに対応するユーザーを返す
  def current_company
    if (company_id = session[:company_id])
      @current_company ||= Company.find_by(id: company_id)
    elsif (company_id = cookies.signed[:company_id])
      company = Company.find_by(id: company_id)
      if company && company.authenticated?(:remember, cookies[:remember_token])
        log_in company
        @current_company = company
      end
    end
  end

  # 渡されたユーザーがカレントユーザーであればtrueを返す
  def current_company?(company)
    company && company == current_company
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def company_logged_in?
    !current_company.nil?
  end

  # 現在のユーザーをログアウトする
  def company_log_out
    session.delete(:company_id)
    @current_company = nil
  end

  # 永続的セッションを破棄する
  def forget(company)
    company.forget
    cookies.delete(:company_id)
    cookies.delete(:remember_token)
  end

  # 現在のユーザーをログアウトする
  def company_log_out
    forget(current_company)
    session.delete(:company_id)
    @current_company = nil
  end

end
