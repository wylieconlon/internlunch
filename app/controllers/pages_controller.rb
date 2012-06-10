class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home]
  before_filter :incomplete_information

  def incomplete_information
    @user = current_user
    if user_signed_in?
        if (!@user.living_location? ||  !@user.company_id?)
          redirect_to :add_user_info_form
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

  def geofeed
    @companies = Company.all
    @kml = Array.new
    @companies.each do |company|
      users = User.where("company_id = ?", company.id)
      @kml.push([company, users])
    end

	mime_type = Mime::Type.lookup_by_extension('rss')
	content_type = mime_type.to_s unless mime_type.nil?
    render :layout => false, :content_type => content_type
  end
end
