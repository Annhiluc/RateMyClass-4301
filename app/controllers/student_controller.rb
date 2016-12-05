class StudentController < ApplicationController
    def list
        @students = Student.all
    end
    
    def show
        @student = Student.find(params[:id])
        @ratingsCourse  = RateCourse.where(user_id: @student.user_id)
        @ratingsProf = RateProfessor.where(user_id: @student.user_id)
        sql = "select *
            from
            (
            SELECT R.u1 as user1, R.u2 as user2, 1.0 * R.count / (U1.cnt + U2.cnt - R.count) AS similarity, R.count as prof
            FROM SharedRatings R, U U1, U U2
            WHERE U1.User_ID = '#{@student.user_id}' and R.u1 = U1.User_ID AND R.u2 = U2.User_ID AND u1 < u2   )
            where similarity > .5"
        @results = ActiveRecord::Base.connection.exec_query(sql)

        sql2 = "select *
            from
            (
            SELECT R.u1 as user1, R.u2 as user2, 1.0 * R.count / (U1.cnt + U2.cnt - R.count) AS similarity, R.count as course
            FROM SharedRatings2 R, UU U1, UU U2
            WHERE U1.User_ID = '#{@student.user_id}' and R.u1 = U1.User_ID AND R.u2 = U2.User_ID AND u1 < u2)
            where similarity > .5"
        @results2 = ActiveRecord::Base.connection.exec_query(sql2)
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
        redirect_to '/'
    end
end
