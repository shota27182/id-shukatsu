class Users::BasicsController < ApplicationController
    before_action :logged_in_user
    before_action :already_basic_registered
    layout 'application2.html.erb'
    
    def index
        @user = User.find(current_user.id)
        @users_basics_form = UsersBasicsForm.new
    end
      
    def create
        @user = User.find(current_user.id)
        params[:users_basics_form][:birthday] = Date.new params[:users_basics_form]["birthday(1i)"].to_i,params[:users_basics_form]["birthday(2i)"].to_i,params[:users_basics_form]["birthday(3i)"].to_i
        @users_basics_form = UsersBasicsForm.new(users_basics_form_params)
        if @users_basics_form.save
            redirect_to '/users/cores'
        else
            render action: "index"
        end
    end
    
    private
      
      def users_basics_form_params
            params.require(:users_basics_form).permit(:kana,:address1,:address2,:building_name,:tel,:birthday, :sex, :university ,:department ,:faculty ,:highschool, :seminar, :classification, :grade_id, :magazine, :scout).merge(user_id: current_user.id)
      end
      
      def already_basic_registered
        if logged_in? && (current_user.status == 'basic_registered' || current_user.status == 'core_registered')
          redirect_to '/mypage'
        end
      end
end
