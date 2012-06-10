class RegisterController < ApplicationController
  def living 

  end

  def living_save
    @user = current_user

    @user.company = Company.find(param[:company_id])
  end

  def work
  end

  def work_save
  end

  def living
  end
end
