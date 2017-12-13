class StudentsController < ApplicationController
        def index
            @student = Students.all
        end
                
        def show
            @dojo = Dojo.find(params[:id])
            @student = Dojo.find(params[:id]).students.where(id: params[:student_id])
            render "show"
        end
        def edit
            @dojos = Dojo.all
            @dojo = Dojo.find(params[:id])
            @student = Dojo.find(params[:id]).students.where(id: params[:student_id])
            render "edit"
        end
        def update
            student = Student.find(params[:student_id])
    
            if params[:student][:first_name] != ""
                student.first_name = params[:student][:first_name]
            end
            if params[:student][:last_name] != ""
                student.last_name = params[:student][:last_name]
            end
            if params[:student][:email] != ""
                student.email = params[:student][:email]
            end
            if params[:student][:dojo]
                student.dojo = Dojo.find(params[:student][:dojo])
            end
            
            student.save
            
            redirect_to "/dojos/#{Dojo.find(params[:student][:dojo]).id}"
        end
    
    end