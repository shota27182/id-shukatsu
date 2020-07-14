class Mypage::EducationController < ApplicationController
    before_action :logged_in_user
    def index
        user = User.find(current_user.id)
        education = user.education
        if education.present?
            @mypage_educations_form = MypageEducationsForm.new(grade_id: education.grade_id,classification: education.classification,university: education.university, department: education.department, faculty: education.faculty, highschool: education.highschool, seminar: education.seminar)
        else
            @mypage_educations_form = MypageEducationsForm.new
        end
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
          params.require(:mypage_educations_form).permit(:university ,:department ,:faculty ,:highschool, :seminar, :classification, :grade_id).merge(user_id: current_user.id)
      end
end
