class Admin::KiosksController < Admin::AdminController

  before_action :authenticate_user!

  def index
    @kiosks = Kiosk.all
  end

  def show
    @kiosk = Kiosk.find params[:id]
  end

  def new
    @kiosk = Kiosk.new
  end

  def create
    @kiosk = Kiosk.new params.require(:kiosk).permit(:name)
    if @kiosk.save
      redirect_to [:admin, @kiosk], notice: "Created!"
    else
      render :new
    end
  end

  def edit
    @kiosk = Kiosk.find params[:id]
  end

  def update
    @kiosk = Kiosk.find params[:id]
    if @kiosk.update params.require(:kiosk).permit(:name)
      redirect_to [:admin, @kiosk], notice: "Updated!"
    else
      render :edit
    end
  end
end
