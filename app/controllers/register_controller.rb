class RegisterController < ApplicationController
  before_filter :authenticate_user!
  
  def index 

  end

  def create
    @user = current_user

    if @company = Company.find(params[:company_id])
      @user.company_id = @company.company_id    
    else
      @company = Company.create(:name => params[:company_name], :address => params[:company_address])
      @user.company_id = @company.company_id
    end

    @user.work_location = params[:work_location]
    @user.living_location = params[:living_location]

    respond_to do |format|
      if @user.save
        #redirect_to :root
      else
        format.html { render action: "index" }
      end
    end
  end
end
