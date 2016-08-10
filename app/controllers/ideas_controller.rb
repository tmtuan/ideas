class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
    @tags = ActsAsTaggableOn::Tag.all

    @searchkey = ''
    if params[:q] != nil
      @searchkey = params[:q]
      @ideas = Idea.where('lower(content) LIKE ? OR lower(description) LIKE ?',  '%' + @searchkey.downcase + '%',  '%' + @searchkey.downcase + '%')
    end
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

    if @idea.update(idea_params)
      redirect_to @idea
    else
      render 'edit'
    end

  end

  def match

    @tagname = params[:tag]
    @ideas = Idea.tagged_with(@tagname)
    @tags = ActsAsTaggableOn::Tag.all


  end

  def destroy

    @idea.destroy

    redirect_to ideas_index_path
  end

  def tagged
    if params[:tag].present?
      @ideas = Idea.tagged_with(params[:tag])
    else
      @ideas = Idea.all
    end
  end

  private
    def idea_params
      params.require(:idea).permit(:content, :description, :avatar, :tag_list)
    end

    def find_idea
      @idea = Idea.find(params[:id])
    end

end
