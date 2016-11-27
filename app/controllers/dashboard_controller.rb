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

    def index 
        sql =  "select (s1 + s2 + s3 + s4 + s5 + s6 + s7) as totalCount
            from (select count(*) as s1
            from Student), (select count(*) as s2
            from Professor),(select count(*) as s3
            from School), (select count(*) as s4
            from Department), (select count(*) as s5
            from Course), (select count(*) as s6
            from RateCourse), (select count(*) as s7
            from RateProfessor)"
        @result = ActiveRecord::Base.connection.exec_query(sql)
    end
end
