class StoriesController < ApplicationController
  def new
    @story = Story.new
  end

  def index
    @stories = Story.all
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update_attributes(params[:story])
    if @story.save
      redirect_to @story
    else
      render :action => :new
    end
  end

  def create
    @story = Story.new(params[:story])
    if @story.save
      redirect_to @story
    else
      render :action => :new
    end
  end

  def show
    @story = Story.find(params[:id])
  end
end
