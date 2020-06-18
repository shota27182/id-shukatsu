class AccountActivationsController < ApplicationController
    
    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated  && user.authenticated(:activation, params[:id])
            user.activate
            log_in user
            redirect_to '/users/welcome'
        else
            redirect_to '/users/wait'
        end
    end
end
