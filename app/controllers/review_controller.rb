class ReviewController < ApplicationController
	
	def new
		@rate_professor = RateProfessor.new
        
	end
	def rateprofessor_param_create
		params.require(:rateProfessor).permit(:rating_lecture, :rating_grading, :rating_helpful, :rating_interest,  :prof_id, :user_id)
	end
	def create
		@rate_professor = RateProfessor.new(rateprofessor_params_create)
		if @rateProfessor.save
			
		else
			@rateProfessor = RateProfessor.all
			render :action => 'new'
		end 
    end

end
