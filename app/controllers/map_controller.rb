
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
    
          #sql = " SELECT AVG(average_interest)
           #       FROM school s, department d, class c, ratecourse r
            #      WHERE s.school_id = d.school_id, c.dept_id = d.dept_id c.course_id = r.course_id  
             #     GROUP BY s.state"
              #    @result = ActiveRecord::Base.connection.exec_query(sql)
  
  
          #each state gets a marker 50 states total
  
          #California
        #  var marker1 = L.marker([36.7783, 119.4179]).addTo(mymap);
        ## marker1.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
  
          ##Pennsylvania
          #var marker2 = L.marker([41.2033, 77.1945]).addTo(mymap);
          #marker2.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
  
          #Florida
          #var marker3 = L.marker([27.6648, 81.5158]).addTo(mymap);
          #marker3.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
  
          #Minnesota
          #var marker4 = L.marker([46.7296, 94.6859]).addTo(mymap);
          #marker4.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
    #end
end   
