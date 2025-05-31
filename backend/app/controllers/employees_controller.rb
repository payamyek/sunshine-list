class EmployeesController < ApplicationController
  def index
    @employees = Employee.order(id: :asc).page(params[:page])
    render json: @employees
  end

  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

end
