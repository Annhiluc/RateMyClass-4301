class DepartmentController < ApplicationController
	 def show
    	@department = Department.find(params[:id])
    	@professors = Professor.where(dept_id: @department.id)
    	@courses = Course.where(dept_id: @department.id)

    end
end

