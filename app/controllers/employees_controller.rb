class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
        if @employees
            render json: {message: "employeeeeeee", employees: @employees}                      
        end
    end
    
    def show
        @employee = Employee.find(params[:id]) 
        if @employee
            render json: {message: "employeeeeeee", employees: @employee}                      
        end
    end

    def create
        @employee = Employee.create(
            name: params[:name],
            email: params[:email],
            department: Department.find(params[:department_id]) 
        )   
        if @employee.save
            render json: {message: "Department created succesfully", employee: @employee}, status: :created
        else
            render json: {message: "department creation failed"}, status: :unprocessable_entity
        end
    end


    def update
        @employee = Employee.find(params[:id])
        if !@employee
            render json: {message: "no employee found "}
        end
        @employee.update(name: params[:name], email: params[:email], department: params[:department])

        if @employee.update
            render json: {message: "employee Updated succesfully", employee: @employee}
        else
            render json: {message: "updating failed"}
        end
    end

    def delete
        @employee = Employee.find(params[:id])
        if !@employee
            render json: {message: "no employee found "}
        end
        @employee.destroy
        if @employee.destroy
            render json: {message: "employee deleting succesfully", employee: @employee}
        else
            render json: {message: "deleting failed"}
        end
    end
end
