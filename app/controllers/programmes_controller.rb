class ProgrammesController < ApplicationController

  def index
    @programmes = Programme.find(:all, :include => :play)
  end

  def show
    @programme = Programme.find(params[:id])
  end

end
