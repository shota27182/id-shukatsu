class Users::BasicsController < ApplicationController
    before_action :logged_in_user
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
            render action: :index
        end
    end
    
    private
      
      def users_basics_form_params
            params.require(:users_basics_form).permit(:kana,:address1,:address2,:building_name,:tel,:highschool,:birthday).merge(user_id: current_user.id)
      end
      
      def birthday_join
          # ブランク時のエラー回避のため、ブランクだったら何もしない
          if params[:users_basics_form]["birthday(1i)"].empty? && params[:users_basics_form]["birthday(2i)"].empty? && params[:users_basics_form]["birthday(3i)"].empty?
              return
          end
          # 年月日別々できたものを結合して新しいDate型変数を作って返す
          Date.new params[:users_basics_form]["birthday(1i)"].to_i,params[:users_basics_form]["birthday(2i)"].to_i,params[:users_basics_form]["birthday(3i)"].to_i
      end
end
