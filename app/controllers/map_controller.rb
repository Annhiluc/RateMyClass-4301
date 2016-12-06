
#!/usr/bin/env ruby
class MapController < ApplicationController
    #<a href="" onclick="this.style.backgroundColor='#990000'">Paint it red</a>
    def show
        sql = " select s.state as state, avg(r.rating_interest) as avgRating
                from school s, department d, course c, ratecourse r
                where s.school_id = d.school_id and c.dept_id = d.dept_id and c.course_id = r.course_id  
                group by s.state"
                @result = ActiveRecord::Base.connection.exec_query(sql)
                
    end
end   
