class ProfessorController < ApplicationController

	def show
    	@professor = Professor.find(params[:id])
    	@courses = Course.where(prof_id: @professor.prof_id)
    	@ratings = RateProfessor.where(prof_id: @professor.prof_id)

    end

end
