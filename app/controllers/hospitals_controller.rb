class HospitalsController < ApplicationController

  before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]

  def current_user_must_be_owner
     @hospital = Hospital.find(params[:id])
     if @hospital.user != current_user
       redirect_to root_url, :alert => "Not authorized!"
     end
  end

  def index
    @q = Hospital.ransack(params[:q])
    @hospitals = @q.result(:distinct => true).includes(:departments)

  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new
    @hospital.address = params[:address]
    @hospital.city = params[:city]
    @hospital.name = params[:name]

    if @hospital.save
      redirect_to "/hospitals", :notice => "Hospital created successfully."
    else
      render 'new'
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])

    @hospital.address = params[:address]
    @hospital.city = params[:city]
    @hospital.name = params[:name]

    if @hospital.save
      redirect_to "/hospitals", :notice => "Hospital updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @hospital = Hospital.find(params[:id])

    @hospital.destroy

    redirect_to "/hospitals", :notice => "Hospital deleted."
  end

end
