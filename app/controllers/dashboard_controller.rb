class DashboardController < ApplicationController
	def search_professor
		#@search = :prof_name
		@professors = Professor.where(:name => params[:professor][:prof_name])
		#@professors = Professor.find(params[:prof_name])
	end

	def show_professor
		@professor = Professor.find(params[:id])
	end

	def search_course
		@courses = Course.where(:name => params[:course][:course_name])
	end

	def show_course
		@course = Course.find(params[:id])
	end
end
