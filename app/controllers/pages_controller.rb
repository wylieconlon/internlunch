class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home]
  before_filter :incomplete_information

  def incomplete_information
    @user = current_user
    if user_signed_in?
        if (! @user.try(:living_location) ||  !@user.get(:working_location))
          redirect_to :controller => :register, :action => :work
        end
    end
    return true
  end

  def home
    if user_signed_in?
      @login = 'Logged in'
    @user = current_user.Facebook
    else
      @login = 'logged out'
    end

  end

  def kml_by_company
    @companies = Company.all
    @kml = Array.new
    @companies.each do |company|
      users = User.where("company_id = ?", company.id)
      @kml.push([company, users])
    end

    render :layout => false
  end
end

