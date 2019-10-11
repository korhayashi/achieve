class TukuttersController < ApplicationController
  def index
    @tukutter = Tukutter.new
    @posts = Tukutter.order(created_at: :desc)
  end

  def create
    @tukutter = Tukutter.new(tukutter_params)
    if @tukutter.save
      redirect_to tukutters_path
    else
      render :index
    end
  end

  def edit
    @tukutter = Tukutter.find(params[:id])
  end

  def update
    @tukutter = Tukutter.find(params[:id])
    if @tukutter.update(tukutter_params)
      redirect_to tukutters_path
    else
      render :edit
    end
  end

  def destroy
    @tukutter = Tukutter.find(params[:id])
    @tukutter.destroy
  end

  private

  def tukutter_params
    params.require(:tukutter).permit(:content)
  end
end
