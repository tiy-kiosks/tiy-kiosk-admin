class Admin::SessionsController < Admin::AdminController
  def new
  end

  def create
    @current_user = User.where("username ILIKE ?", params[:username]).first
    if @current_user.try :authenticate, params[:password]
      session[:user_id] = @current_user.id
      redirect_to admin_root_path, notice: "Signed in!"
    else
      flash.now[:alert] = "Something was wrong with your username and/or password"
      render :new
    end
  end

  def delete
    session.delete(:user_id)
    redirect_to admin_root_path, notice: "signed out!"
  end
end
