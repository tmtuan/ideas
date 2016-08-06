class TagsController < ApplicationController
  before_action :find_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create

    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @tag.update(tag_params)
      redirect_to @tag
    else
      render 'edit'
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_index_path
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end

    def find_tag
      @tag = Tag.find(params[:id])
    end
end
