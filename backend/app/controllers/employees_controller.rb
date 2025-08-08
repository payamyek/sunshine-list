class EmployeesController < ApplicationController
  def index
    if params[:q].present?
      @employees = Employee.search(params[:q]).order(id: :asc).page(params[:page]).per(params[:size])
    else
      @employees = Employee.order(id: :asc).page(params[:page]).per(params[:size])
    end

    render json: @employees, include: [ :sector, :job_title, :employer ]
  end

  def show
    @employee = Employee.find(params[:id])
    render json: @employee, include: [ :sector, :job_title, :employer ]
  end
end
