class SchoolController < ApplicationController
    def list
        @schools = School.all
    end
    
    def show
    	@school = School.find(params[:id])
    	@departments = Department.where(school_id: @school.id)
        
    end

    
    
end
