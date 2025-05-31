class EmployeesController < ApplicationController
  def index
    @employees = Employee.order(id: :asc).page(params[:page]).per(params[:size])
    render json: @employees
  end

  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

end
