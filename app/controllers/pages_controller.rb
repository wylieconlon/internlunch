class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home]

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
      users = User.where("company_id = ?", company.company_id)
      @kml.push([company, users])
    end

  end
end

