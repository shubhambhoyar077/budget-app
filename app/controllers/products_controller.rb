class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to group_path(Group.find(product_params[:group_id][0]))
    else
      render :new
    end
  end

  private
   
  def product_params
    params.require(:product).permit(:name, :amount, group_ids: [])
  end
end
