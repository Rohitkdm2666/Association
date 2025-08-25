class DepartmentsController < ApplicationController
    def index
        @departments = Department.all
    end
    
    def show
        @departments = Department.find(params[:id]) 
    end

    def create
        @department = Department.create(
            name: params[:name],
            number_of_employee: params[:number_of_employee]
        ) 
        if @department.save
            render json: {message: "Department created succesfully", Department: @department}, status: :created
        else
            render json: {message: "department creation failed"}, status: :unprocessable_entity
        end
    end


    def update
        @department = Department.find(params[:id])
        if !@department
            render json: {message: "no department found "}
        end
        @department.update(name: params[:name], number_of_employee: params[:number_of_employee] )

        if @department.update
            render json: {message: "Department Updated succesfully", department: @department}
        else
            render json: {message: "updating failed"}
        end
    end

    def delete
        @department = Department.find(params[:id])
        if @department
            if @department.destroy
                render json: {message: "Department deleted succesfully", department: @department}
            else
                render json: {message: "deleting failed"}
            end
        else
            render json: {message: "no department found "}
        end
        
    end


end