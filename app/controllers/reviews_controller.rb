class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @review = Review.new
  end


  def create
    @idea = Idea.find(params[:idea_id])
    @review = Review.new review_params
    @review.idea = @idea
    @review.user = current_user

    if @review.save 
      flash[:notice]= "Review added succesfully "
      redirect_to(idea_path(@idea))
    else
      render('new')
    end

  end


  def edit
  end

  def delete
  end

  private 
  def review_params
    params.require(:review).permit(:body)
  end


end
