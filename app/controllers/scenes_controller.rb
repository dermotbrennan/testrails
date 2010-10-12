class ScenesController < ApplicationController
  def new
    story = Story.find(params[:story_id])
    @scene = Scene.new(:story => story)
  end

  def index
    @scenes = Scene.all
  end

  def create
    @scene = Scene.new(params[:scene])
    if @scene.save
      redirect_to story_scene_path(@scene, :story => @scene.story.id), :success => "Scene created successfully"
    else
      render :action => :new
    end
  end

  def show
    @scene = Scene.find(params[:id])
  end

  def destroy
    @scene = Scene.find(params[:id])
    redirect_to @scene.story, :success => "Scene deleted"
    @scene.destroy
  end
end
