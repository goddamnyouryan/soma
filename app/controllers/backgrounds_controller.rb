class BackgroundsController < ApplicationController
  def index
    @backgrounds = Background.all
    @background = Background.new
  end

  def new
    @background = Background.new
  end

  def create
    @background = Background.create(params[:background])
    if @background.save
      redirect_to backgrounds_path, :notice => "Background Successfully Updated"
    else
      render :new
    end
  end

  def destroy
    @background = Background.find params[:id]
    @background.destroy
    redirect_to :backgrounds_path, :notice => "Background removed."
  end

end
