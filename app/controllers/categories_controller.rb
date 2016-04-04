class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:index]
 

  def new
    @category = Category.new
  end
  
  def index
  end
    
  def create
    @category = Category.create(category_params)
    
    if @category.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
