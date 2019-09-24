class IdeasController < ApplicationController
  # load_and_authorize_resource
  layout 'admin'
  before_action :confirm_logged_in, :except => [:show, :index, :logout]

  def index
    @ideas = Idea.all
    @reviews = Review.all
  end

  def show
    @review = Review.new
    @idea = Idea.find(params[:id])
    @reviews = @idea.reviews.order(created_at: :DESC)
    # @reviews = Review.all(params[:idea_id])

  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save 
    flash[:notice] = "Created succesfully"
    redirect_to(ideas_path)
    else 
    render('new')
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(idea_params)
      flash[:notice] = "Updated Succesfully!"
      redirect_to(ideas_path(@idea))
    else
      render('edit')
    end

  end

  def delete
    @idea = Idea.find(params[:id])
  end

  def destroy
    @idea = Idea.find(params[:id])
    if @idea.destroy 
      flash[:notice] = "'#{@idea.title}'Destroyed  Succesfully"
      redirect_to(ideas_path)
    else
      render('delete')
    end
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :body, :user_id)
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in first"
      redirect_to(access_login_path)
    end
  end

end
