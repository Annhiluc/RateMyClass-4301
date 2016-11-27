class ReviewProfessorController < ApplicationController
	#before_action :set_professor
    def new
		@rate_professor = RateProfessor.new
		@professor = Professor.find(params[:id])
        
	end
	def rateprofessor_params_create
		params.require(:rateProfessor).permit(:prof_id, :rating_lecture, :rating_grading, :rating_helpful, :rating_interest, :user_id)
	end
	def create
		
		@rate_professor = RateProfessor.new(rateprofessor_params_create)
		
		if @rate_professor.save
			redirect_to :controller => 'professor', :action => 'show', :id => @rate_professor.prof_id
		else
			@rate_professor = RateProfessor.all
			render :action => 'new'
		end 
    end

    
end
