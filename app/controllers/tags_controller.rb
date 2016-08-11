class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @ideas = Idea.tagged_with(@tag.name)
  end

  def destroy
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])

    @tag.destroy

    redirect_to tags_path

  end
end
