class HomeController < ApplicationController
    def list
        @students = Student.all
    end
    
    def show
        @student = Student.find(params[:id])
    end
    
    def new
        @student = Student.new
        @students = Student.all
    end
    
    def student_param_create
        params.require(:students).permit(:user_id, :name, :school_year, :password)
    end

    def create
        @student = Student.new(student_param_create)

        if @student.save
            redirect_to :action => 'list'
        else
            @students = Student.all
            render :action => 'new'
        end
    end

    def edit
        @student = Student.find(params[:id])
        @students = Student.all
    end

    def student_param_edit
        params.require(:student).permit(:school_year, :password)
    end
    
    def update
        @student = Student.find(params[:id])
	
        if @student.update_attributes(student_param_edit)
            redirect_to :action => 'show', :id => @student
        else
            @students = Subject.all
            render :action => 'edit'
        end
    end

    def delete
        Student.find(params[:id]).destroy
        redirect_to :action => 'list'
    end
end
