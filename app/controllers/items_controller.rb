class ItemsController < ApplicationController
  def new
    @scene = Scene.find(params[:scene_id])
    @item = Item.new(:scene => @scene)
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to scene_item_path(@item, :scene_id => @item.scene.id), :success => "Item created successfully"
    else
      render :action => :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    redirect_to @item.story, :success => "Item deleted"
    @item.destroy
  end
end