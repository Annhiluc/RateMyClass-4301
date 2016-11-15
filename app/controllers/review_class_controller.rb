class ReviewClassController < ApplicationController
	def new
	  @rate_course = RateCourse.new
    end
	def ratecourse_param_create
		params.require(:rateCourse).permit(:rating_difficult, :rating_interest, :course_id, :user_id)
	end
	def create
		@rate_course = RateCourse.new(ratecourse_params_create)
		if @rate_course.save
			redirect_to @class
		else
			@rate_course = RateCourse.all
			render :action => 'new'
		end 
    end



end
