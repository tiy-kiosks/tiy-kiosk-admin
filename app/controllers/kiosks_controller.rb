class KiosksController < ApplicationController


  def index
    @kiosks = Kiosk.all
  end
  def show
    @kiosk = Kiosk.last
  end
end
