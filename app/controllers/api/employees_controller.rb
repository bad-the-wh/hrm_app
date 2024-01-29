class Api::EmployeesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_employee, only: [:show, :update, :destroy]
    
    def index
      @employees = Employee.all
      render json: @employees
    end
      
    def create
      @employee = Employee.new(employee_params)
      @employee.ldap = generate_random_ldap_entry   
      
      if @employee.save
        render json: @employee, status: :created
        redirect_to @employee
      else
        render json: @employee.errors, status: :unprocessable_entity
      end
    
    end
      
    def show
      render json: @employee
    end
      
    def update
      if @employee.update(employee_params)
        render json: @employee
        redirect_to @employee
      else
        render json: @employee.errors, status: :unprocessable_entity
      end
    end
      
    def destroy
      @employee.destroy
      redirect_to root_path
    end
      
    private
      
    def set_employee
      @employee = Employee.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
      
  def employee_params
    params.require(:employee).permit(:LDAP, :name, :email, :position, :birthdate)
  end

  def generate_random_ldap_entry(name)
    random_number = rand(1_000_000_000..9_999_999_999)
    name.downcase.gsub(/\s+/, '') + random_number.to_s
  end

end