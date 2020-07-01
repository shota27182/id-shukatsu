class Mypage::ProfileController < ApplicationController
    before_action :logged_in_user
    def index
    　　@user=current_user
    　　@general=current_user.general
    　　@contact=current_user.contact
    　　@education=current_user.education
    　　@company_scales=current_user.company_scales
    　　@industries=current_user.industries
    end
end
