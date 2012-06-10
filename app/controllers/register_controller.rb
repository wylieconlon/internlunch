class RegisterController < ApplicationController
  def index 

  end

  def create
    @user = current_user
    @user.company_id = Company.find(params[:company_id])
    @user.work_location = params[:work_location]
    @user.living_location = params[:living_location]

    respond_to do |format|
      if @user.save
        redirect_to :root
      else
        format.html { render action: "index" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
