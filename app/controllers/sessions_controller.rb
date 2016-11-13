class SessionsController < ApplicationController
    #before_filter :authorize needs to be placed before each page that needs authorization
    def new
        
    end
    
    def create
        student = Student.find(params[:user_id])

        if student && student.password == (params[:password])
            session[:user_id] = student.user_id
            redirect_to '/'
        else
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end
end
