class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = current_user.groups.find(params[:id])
    @products = @group.products.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'Category created succefully'
    else
      render :new, alert: @group.errors.full_messages[0]
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
