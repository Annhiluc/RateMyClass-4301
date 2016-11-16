class CourseController < ApplicationController

	def show
    	@course = Course.find(params[:id])
    	@professors = Professor.where(prof_id: @course.prof_id)
    	@ratings = RateCourse.where(course_id: @course.course_id)

    end
end
