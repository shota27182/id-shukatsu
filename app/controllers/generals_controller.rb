class GeneralsController < ApplicationController
    before_action :logged_in_user
    layout 'application2.html.erb'
    
    def create
        @user.build_general
        @user.build_education
        if @user.update(user_params)
            redirect_to '/users/core'
        else
            render '/users/basic'
        end
    end
    
    private
        
        def user_params
            params.require(:user).permit(:name, general_attributes:[:kana,:address1,:address2,:building_name,:tel],education_attributes:[:sesminar,:highschool])
        end
end
