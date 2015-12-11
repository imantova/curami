class DepartmentsController < ApplicationController
    before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]

  def current_user_must_be_owner
     @department = Department.find(params[:id])
     if @department.user != current_user
       redirect_to root_url, :alert => "Not authorized!"
     end
  end

  def index
    @departments = Department.all
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new
    @department.name = params[:name]

    if @department.save
      redirect_to "/departments", :notice => "Department created successfully."
    else
      render 'new'
    end
  end

  def edit
    @department = Department.find(params[:id])
  end

  def update
    @department = Department.find(params[:id])

    @department.name = params[:name]

    if @department.save
      redirect_to "/departments", :notice => "Department updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @department = Department.find(params[:id])

    @department.destroy

    redirect_to "/departments", :notice => "Department deleted."
  end
end
