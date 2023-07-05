class ProductsController < ApplicationController
  def new
    @group = current_user.groups.find(params[:group_id])
    @product = Product.new
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to group_path(@group), notice: 'Transaction is added'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :amount, group_ids: [])
  end
end
