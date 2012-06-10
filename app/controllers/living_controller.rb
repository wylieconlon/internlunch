class LivingController < ApplicationController
  def index
  end

  def create
    @user = current_user
    @user.living_location = params[:living_location]

    respond_to do |format|
      if @user.save
        format.html { redirect_to :root, notice: 'Company was successfully created.' }
      else
        format.html { render action: "index" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
