class ReviewCourseController < ApplicationController
	def new
	  @rate_course = RateCourse.new
	  @course = Course.find(params[:id])
    end

	def ratecourse_params_create
		params.require(:rateCourse).permit(:course_id, :rating_difficult, :rating_interest, :course_id, :user_id)
	end
	
	def create
		@rate_course = RateCourse.new(ratecourse_params_create)
		if @rate_course.save
			redirect_to :controller => 'course', :action => 'show', :id => @rate_course.course_id
		else
			@rate_course = RateCourse.all
			render :action => 'new'
		end 
    end



end
