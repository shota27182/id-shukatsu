class Mypage::GeneralController < ApplicationController
    before_action :logged_in_user
    def index
        user = User.find(current_user.id)
        general = user.general
        if general.present?
            @mypage_generals_form = MypageGeneralsForm.new(name: user.name, address1: general.address1, address2: general.address2, building_name: general.building_name,tel: general.tel,birthday: general.birthday)
        else
            @mypage_generals_form = MypageGeneralsForm.new(name: user.name)
        end
    end
    
    def create
        params[:mypage_generals_form][:birthday] = Date.new params[:mypage_generals_form]["birthday(1i)"].to_i,params[:mypage_generals_form]["birthday(2i)"].to_i,params[:mypage_generals_form]["birthday(3i)"].to_i
        @mypage_generals_form = MypageGeneralsForm.new(mypage_generals_form_params)
        @mypage_generals_form.save
        redirect_to '/mypage/general'
    rescue
        render action:'index'
    end
    
    private
      
      def mypage_generals_form_params
          params.require(:mypage_generals_form).permit(:name,:birthday,:tel,:address1,:address2,:building_name).merge(user_id: current_user.id)
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
