class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end


  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to @idea
    else
      render 'new'
    end

  end

  def show
    @idea = Idea.find(params[:id])

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def idea_params
    params.require(:idea).permit(:content, :description)
  end
end
