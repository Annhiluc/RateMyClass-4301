class StudentController < ApplicationController
    def list
        @students = Student.all
    end
    
    def show
        @student = Student.find(params[:id])
    end
    
    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params_create)

        if @student.save
            redirect_to :action => 'show', :id => @student
        else
            @students = Student.all
            render :action => 'new'
        end
    end

    def student_params_create
        params.require(:student).permit(:user_id, :name, :school_year, :password)
    end

    def edit
        @student = Student.find(params[:id])
        @students = Student.all
    end

    def student_params_edit
        params.require(:student).permit(:school_year, :password)
    end
    
    def update
        @student = Student.find(params[:id])
	
        if @student.update_attributes(student_params_edit)
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
