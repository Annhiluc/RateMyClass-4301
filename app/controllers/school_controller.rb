class SchoolController < ApplicationController
    def list
        @schools = School.all
    end
    
    def show
    	@school = School.find(params[:id])
    	@departments = Department.where(school_id: @school.id)
    	sql1 = "select p.name as name, p.prof_id as id, avg(r.rating_helpful) as avgHelpful
	    	from professor p, rateprofessor r, department d
			where p.prof_id = r.prof_id and p.dept_id = d.dept_id and 
			d.school_id = #{@school.id} and rownum <= 5
			group by p.name, p.prof_id
			order by avg(rating_helpful) desc"
		@result1= ActiveRecord::Base.connection.exec_query(sql1)

		sql2 = "select p.name as name, p.prof_id as id, avg(r.rating_interest) as avgInt
	    	from professor p, rateprofessor r, department d
			where p.prof_id = r.prof_id and p.dept_id = d.dept_id and 
			d.school_id = #{@school.id} and rownum <= 5
			group by p.name, p.prof_id
			order by avg(rating_interest) desc"
		@result2= ActiveRecord::Base.connection.exec_query(sql2)

		sql3 = "select p.name as name, p.prof_id as id, avg(r.rating_grading) as avgGr
	    	from professor p, rateprofessor r, department d
			where p.prof_id = r.prof_id and p.dept_id = d.dept_id and 
			d.school_id = #{@school.id} and rownum <= 5
			group by p.name, p.prof_id
			order by avg(rating_grading) desc"
		@result3= ActiveRecord::Base.connection.exec_query(sql3)

		sql4 = "select p.name as name, p.prof_id as id, avg(r.rating_lecture) as avglec
	    	from professor p, rateprofessor r, department d
			where p.prof_id = r.prof_id and p.dept_id = d.dept_id and 
			d.school_id = #{@school.id} and rownum <= 5
			group by p.name, p.prof_id
			order by avg(rating_lecture) desc"
		@result4= ActiveRecord::Base.connection.exec_query(sql4)
    end

    def self.execute_sql(*sql_array)     
    	connection.execute(send(:sanitize_sql_array, sql_array))
  	end

    
    
end
