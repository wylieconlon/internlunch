class PagesController < ApplicationController
  def home
    @title = "Home"
    
    if signed_in?
#    	@ideas = User.find(current_user).ideas
#    	render 'ideas/index'
    end
  end
end

