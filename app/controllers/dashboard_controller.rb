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
        sqlTotal =  "select (s1 + s2 + s3 + s4 + s5 + s6 + s7) as totalCount
            from (select count(*) as s1
            from Student), (select count(*) as s2
            from Professor),(select count(*) as s3
            from School), (select count(*) as s4
            from Department), (select count(*) as s5
            from Course), (select count(*) as s6
            from RateCourse), (select count(*) as s7
            from RateProfessor)"
        @resultTotal = ActiveRecord::Base.connection.exec_query(sqlTotal)

		sqlTopDepartments =  "select distinct School.name as name, School.school_id as id
			from School, Department, (select Course.dept_id as dept
			from Course, RateCourse
			where Course.course_id = RateCourse.course_id
			group by Course.dept_id having avg(rating_interest) > 4.25)
			where dept=Department.dept_id
			and School.school_id=Department.school_id"
        @resultTopDepartments = ActiveRecord::Base.connection.exec_query(sqlTopDepartments)

		sqlTopClasses =  "select distinct courseName as name, courseId as id
			from Department, (select Course.dept_id as dept, Course.name as courseName, Course.course_id as courseId
			from Course, RateCourse
			where Course.course_id = RateCourse.course_id
			group by Course.dept_id, Course.name, Course.course_id having avg(rating_interest) > 4.75)
			where dept=Department.dept_id"
        @resultTopClasses = ActiveRecord::Base.connection.exec_query(sqlTopClasses)

    end
end
