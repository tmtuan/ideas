class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

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

  end

  def edit

  end

  def update

    if @idea.update(params[:idea].permit(:content, :description))
      redirect_to @idea
    else
      render 'edit'
    end

  end

  def destroy

    @idea.destroy

    redirect_to ideas_index_path
  end

  private
    def idea_params
      params.require(:idea).permit(:content, :description)
    end

    def find_idea
      @idea = Idea.find(params[:id])
    end

end
