class WorkController < ApplicationController
  def index
  end

  def create
    @user = current_user
    @user.company_id = Company.find(params[:company_id])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Company was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
