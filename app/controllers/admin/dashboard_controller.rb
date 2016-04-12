class Admin::DashboardController < Admin::AdminController

  before_action :authenticate_user!

  def show
  end
end
