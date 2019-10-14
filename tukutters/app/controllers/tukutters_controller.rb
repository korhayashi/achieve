class TukuttersController < ApplicationController
  before_action :set_tukutter, only: [:edit, :update, :destroy]

  def index
    @posts = Tukutter.order(created_at: :desc)
    @tukutter = Tukutter.new
  end

  def create
    @tukutter = Tukutter.new(tukutter_params)
    if params[:back]
      @posts = Tukutter.order(created_at: :desc)
      render :index
    else
      if @tukutter.save
        redirect_to tukutters_path, notice: "投稿しました"
      else
        @posts = Tukutter.order(created_at: :desc)
        flash.now[:notice] = "投稿に失敗しました"      
        render :index
      end
    end
  end

  def edit
  end

  def update
    if @tukutter.update(tukutter_params)
      redirect_to tukutters_path, notice: "編集しました"
    else
      render :edit
    end
  end

  def destroy
    @tukutter.destroy
    redirect_to tukutters_path, notice: "投稿を削除しました"
  end

  def confirm
    @tukutter = Tukutter.new(tukutter_params)
    @posts = Tukutter.order(created_at: :desc)
    flash.now[:notice] = "投稿に失敗しました"
    render :index if @tukutter.invalid?
  end

  private

  def tukutter_params
    params.require(:tukutter).permit(:content)
  end

  def set_tukutter
    @tukutter = Tukutter.find(params[:id])
  end
end
