class SchoolController < ApplicationController
    def list
        @schools = School.all
    end
    
    def show
        @school = School.find(params[:id])
    end
    
end
