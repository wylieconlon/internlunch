class PagesController < ApplicationController
  before_filter :authenticate_user!

  def home
    @title = "Home"


    
  end

  def kml_by_company
    @companies = Company.all
  end
end

