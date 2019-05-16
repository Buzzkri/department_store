class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  
  def index
    @departments = Department.all
  end

  def show
  
  end

  def new
    @department = Department.new
    render partial: "form"
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path(@departments)
    else
      redirect_to departments_path(@departments)
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @departments.update(department_params)
      redirect_to departments_path(@departments)
    else
      render partial: "form"
    end
  end

  def destroy
    @departments.destroy
    redirect_to departments_path
  end

  private
  def set_department
    @departments = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name)
  end
end

