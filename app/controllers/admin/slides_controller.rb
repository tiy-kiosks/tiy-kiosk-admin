class Admin::SlidesController < Admin::AdminController

  before_action :authenticate_user!

  before_action do
    @kiosk = Kiosk.find params[:kiosk_id]
  end

  def index
    @slides = @kiosk.slides.all
  end

  def show
    @slide = @kiosk.slides.find params[:id]
  end

  def new
    @slide = @kiosk.slides.build
    @slide.end_date = 2.years.from_now
  end

  def create
    @slide = @kiosk.slides.build slide_params
    if @slide.save
      redirect_to [:admin, @kiosk, :slides], notice: "Created!"
    else
      render :new
    end
  end

  def edit
    @slide = @kiosk.slides.find params[:id]
  end

  def update
    @slide = @kiosk.slides.find params[:id]
    if @slide.update slide_params
      redirect_to [:admin, @kiosk, :slides], notice: "Updated!"
    else
      render :edit
    end
  end

  def destroy
    @slide = @kiosk.slides.find params[:id]
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to [:admin, @kiosk, :slides], notice: "Destroyed!" }
    end
  end

  private

  def slide_params
    params.require(:slide).permit(:order_number, :start_date, :end_date, :markdown_content, :pattern)
  end
end
