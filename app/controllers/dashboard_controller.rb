class DashboardController < ApplicationController
	def search_professor
		sql = "select * from Professor where name like \'%" + params[:professor][:prof_name] + "%\'"
		@professors = ActiveRecord::Base.connection.exec_query(sql)
	end

	def search_course
		sql = "select * from Course where name like \'%" + params[:course][:course_name] + "%\'"
		@courses = ActiveRecord::Base.connection.exec_query(sql)
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

        sql2 = "SELECT * FROM (SELECT School.SCHOOL_ID, School.NAME, ROUND(((AVG(DEPT_DIFF) + AVG(DEPT_INT))/2),2) AS SCHOOL_RATING
				FROM (SELECT Department.SCHOOL_ID AS ScID, Department.DEPT_ID, AVG(COUR_DIFF) AS DEPT_DIFF, AVG(COUR_INT) AS DEPT_INT 
  				FROM (SELECT Course.DEPT_ID AS DID, Course.COURSE_ID, AVG(RateCourse.RATING_DIFFICULT) AS COUR_DIFF, AVG(RateCourse.RATING_INTEREST) AS COUR_INT
    			FROM Course, RateCourse
    			WHERE Course.COURSE_ID = RateCourse.COURSE_ID
    			GROUP BY Course.COURSE_ID, Course.DEPT_ID),Department
  				WHERE Department.DEPT_ID = DID
  				GROUP BY Department.DEPT_ID, Department.SCHOOL_ID),School
				WHERE School.SCHOOL_ID = ScID
				GROUP BY School.SCHOOL_ID, School.NAME
				ORDER BY SCHOOL_RATING DESC)
				WHERE ROWNUM <= 5"
		@schools = ActiveRecord::Base.connection.exec_query(sql2)

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
