class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item
  def index
    @departments = @department.item
  end
  
  def show
  end
  
  def new
    @item = @department.topics.new
    render partial: "form"
  end

  def create
    @item = @department.items.new(item_params)

    if @item.save
      # redirect_to [@sub, @topic]
      # redirect_to sub_topic_path(@sub, @topic)
      redirect_to department_item_path(@department.id, @item.id)
    else
      render partial: "form"
    end
  end
  
  def edit    
    render partial: "form"
  end

  def update
    if @item.update(item_params)
      redirect_to department_item_path(@department, @item)
    else
      render partial: "form"
    end
  end

  def destroy
    @item.destroy
    redirect_to department_item_path(@sub)
  end
  
  private
    def set_department
      @departments = Department.find(params[:item_id]) 
    end

    def set_Item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :body)
    end
  end