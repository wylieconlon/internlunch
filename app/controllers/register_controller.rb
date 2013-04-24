class RegisterController < ApplicationController
  before_filter :authenticate_user!
  #protect_from_forgery :except => :create 
  skip_before_filter :verify_authenticity_token
  
  def index
    @companies = Company.all
  end

  def create
    @user = current_user

    if @company = Company.where("name LIKE ? AND address LIKE ?", params[:company_name], params[:company_address]).first
      @user.company_id = @company.id    
    else
      @company = Company.create!(:name => params[:company_name], :address => params[:company_address])
      @user.company_id = @company.id
    end

      @user.living_location = params[:living_location]

      if @user.save
        redirect_to :root
      else
    end
  end
end
