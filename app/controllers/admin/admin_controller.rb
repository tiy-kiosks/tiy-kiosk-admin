class Admin::AdminController < ApplicationController

  layout 'admin'
  
  before_action do
    @current_user = User.find_by id: session[:user_id]
  end

  def authenticate_user!
    if @current_user.nil?
      redirect_to admin_sign_in_path, notice: "Please Sign in"
      return false
    end
  end
end
