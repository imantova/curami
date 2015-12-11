class ReviewsController < ApplicationController

before_action :current_user_must_be_owner, :only => [:edit, :update, :destroy]

def current_user_must_be_owner
@review = Review.find(params[:id])
if @review.user != current_user
redirect_to root_url, :alert => "Not authorized!"
end

end

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(:distinct => true).includes(:hospital)
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    @review.body = params[:body]
    @review.hospital_id = params[:hospital_id]
    @review.visited_on = Chronic.parse(params[:visited_on])
    @review.department_id = params[:department_id]
    @review.user_id = params[:user_id]
    @review.rating = params[:rating]
    @review.title = params[:title]

    if @review.save
      redirect_to "/reviews", :notice => "Review created successfully."
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    @review.body = params[:body]
    @review.hospital_id = params[:hospital_id]
    @review.visited_on = Chronic.parse(params[:visited_on])
    @review.department_id = params[:department_id]
    @review.user_id = params[:user_id]
    @review.rating = params[:rating]
    @review.title = params[:title]

    if @review.save
      redirect_to "/reviews", :notice => "Review updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])

    @review.destroy

    redirect_to "/reviews", :notice => "Review deleted."
  end

  def my_reviews
    @reviews = current_user.reviews
  end
end
