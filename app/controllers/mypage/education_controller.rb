class Mypage::EducationController < ApplicationController
    def index
        user = User.find(current_user.id)
        education = user.education
        @mypage_educations_form = MypageEducationsForm.new(highschool: education.highschool, seminar: education.seminar)
    end
    
    def create
        @mypage_educations_form = MypageEducationsForm.new(mypage_educations_form_params)
        @mypage_educations_form.save
        redirect_to '/mypage/education'
    rescue
        render action:'index'
    end
    
    private
      
      def mypage_educations_form_params
          params.require(:mypage_educations_form).permit(:highschool, :seminar).merge(user_id: current_user.id)
      end
end
