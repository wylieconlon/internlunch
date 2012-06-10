class RegisterController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery :except => :create 
  
  def index
    @companies = Company.all
  end

  def create
    @user = current_user

    if @company = Company.where("name LIKE ? AND address LIKE ?", params[:company_name], params[:company_name]).first
      @user.company_id = @company.id    
    else
      @company = Company.create(:name => params[:company_name], :address => params[:company_address])
      @user.company_id = @company.id
    end

    @user.work_location = params[:work_location]
    @user.living_location = params[:living_location]

      if @user.save
        redirect_to :root
      else
        render action: "index"
      end
  end
end
