class SessionsController < ApplicationController
    #before_filter :authorize needs to be placed before each page that needs authorization
    def new
        
    end
    
    def create
        begin
            student = Student.find(params[:user_id])
        
            rescue ActiveRecord::RecordNotFound  
            redirect_to '/login'
                return
        end


        if student && student.password == (params[:password])
            session[:user_id] = student.user_id
            redirect_to '/'
        else
            redirect_to '/login'
        end
    end
    
    #ActiveRecord::RecordNotFound, :with => :not_found

   #def not_found
    #   raise ActionController::RoutingError.new('Not Found')
   #end
  
    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end
end
