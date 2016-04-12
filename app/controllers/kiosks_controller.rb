class KiosksController < ApplicationController

  def show
    @kiosk = Kiosk.find params[:id]
  end
end
