class IdeasController < ApplicationController
  layout 'admin'

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
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



end
