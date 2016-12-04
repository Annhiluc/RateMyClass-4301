
#!/usr/bin/env ruby
class MapController < ApplicationController
    
    def show
        var mymap = L.map('mapid').setView([37.0902, 95.7129], 13);

        L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={pk.eyJ1IjoibWlubmFoYXNzYW4iLCJhIjoiY2l3YXZyZ2dkMDB4bzJvazJiOTFzNDlvcSJ9.ewmsGD9shpm0_6iGkmhakg}', {
                    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
                    maxZoom: 18,
                    id: 'https://api.mapbox.com/styles/v1/minnahassan/ciwavtxqk002c2qmegay3j0wb.html?title=true&access_token=pk.eyJ1IjoibWlubmFoYXNzYW4iLCJhIjoiY2l3YXZyZ2dkMDB4bzJvazJiOTFzNDlvcSJ9.ewmsGD9shpm0_6iGkmhakg#3.5/38.490208/-96.450194/0',
                    accessToken: 'pk.eyJ1IjoibWlubmFoYXNzYW4iLCJhIjoiY2l3YXZyZ2dkMDB4bzJvazJiOTFzNDlvcSJ9.ewmsGD9shpm0_6iGkmhakg'
                    }).addTo(mymap);


          sql = " SELECT AVG(average_interest)
                  FROM school s, department d, class c, ratecourse r
                  WHERE s.school_id = d.school_id, c.dept_id = d.dept_id c.course_id = r.course_id  
                  GROUP BY s.state"
                  @result = ActiveRecord::Base.connection.exec_query(sql)
  
  
          #each state gets a marker 50 states total
  
          #California
          var marker1 = L.marker([36.7783, 119.4179]).addTo(mymap);
          marker1.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
  
          #Pennsylvania
          var marker2 = L.marker([41.2033, 77.1945]).addTo(mymap);
          marker2.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
  
          #Florida
          var marker3 = L.marker([27.6648, 81.5158]).addTo(mymap);
          marker3.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
  
          #Minnesota
          var marker4 = L.marker([46.7296, 94.6859]).addTo(mymap);
          marker4.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
    end
end   
