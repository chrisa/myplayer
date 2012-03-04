class ProgrammesController < ApplicationController

  def show
    @programme = Programme.find(params[:id])
  end

end
