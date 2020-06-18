class Users::GeneralsController < ApplicationController
    layout 'application2.html.erb'
  
  
    def create
        @general = current_user.build_general(general_params)
        @education = current_user.build_education(education_params)
        @general.save!
        @education.save!
        logger.debug @user.errors.inspect 
        redirect_to '/users/core'
    rescue
        render '/users/basic'
    end
    
    private
      
      def general_params
          params(:general).permit(:kana,:address1,:address2,:building_name,:tel)
      end
      
      def education_params
        params(:education).permit(:seminar,:highschool)
      end
      
      def birthday_join
        date = basic_params[:basic][:general_attributes]
        # ブランク時のエラー回避のため、ブランクだったら何もしない
        if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
          return
        end
        # 年月日別々できたものを結合して新しいDate型変数を作って返す
        Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
      end
end
