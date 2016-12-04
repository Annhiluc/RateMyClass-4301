class Student < ActiveRecord::Base
  
  include ActiveModel::Validations
  #validates_with Validator
  
  self.table_name = "student"
  validates :user_id, 
            :presence => {:message => "Must enter username." },
            :uniqueness => {:message => "Username has already been taken. Sorry, try a new one."}
          

  validates :school_year,
            :presence => {:message =>"Please enter school year."}
            
  validates :password,
            :presence => {:message => "Please enter password."}
  
  
  #@student_no = Student.pluck(:student_no).first

  #ActiveRecord::RecordNotFound, :with => :not_found

  #def not_found
   # raise ActionController::RoutingError.new('Not Found')
  #end
  
  #validates :user_id, uniqueness: { case_sensitive: false } #message: "has already been taken"
  #validates :school_year, inclusion: { in: %w(small medium large), message: "%{value} is not a valid size" }

end