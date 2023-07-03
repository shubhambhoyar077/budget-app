class ProductsController < ApplicationController
  def new
    @group = current_user.groups.find(params[:group_id])
    @product = Product.new
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @product = current_user.products.new(product_params)
    @product.groups << @group
    if @product.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private
   
  def product_params
    params.require(:product).permit(:name, :amount)
  end
end
