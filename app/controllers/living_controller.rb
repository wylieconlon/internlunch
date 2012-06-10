class LivingController < ApplicationController
  def index
  end

  def create
    @user.living_location = params[:living_location]

    if @user.save!
      redirect_to :root
    end
  end
end
