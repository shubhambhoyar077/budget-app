class SplashsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    if user_signed_in?
      redirect_to groups_path
    end
  end
end