class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :toggle_status]

  def index
      @items = Item.where(user_id: current_user.id).order("created_at DESC")
  end

  def show
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
      if @item.save
        redirect_to root_path
      else
        render 'new'
      end
  end
  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def toggle_status
    if @item.complete?
      @item.update_attribute(:completed_at, nil)
      @item.uncomplete!
    elsif @item.uncomplete?
      @item.update_attribute(:completed_at, Time.now)
      @item.complete!
    end

    redirect_to root_path
  end
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description)
  end
end
