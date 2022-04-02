class VideosController < ApplicationController

  def home
    @videos = Video.includes(:user).order('created_at DESC')
  end

  def index
    @videos = Video.where(prefecture_id: params[:prefecture_id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to root_path
    else
      render :new
    end
  end


  def search
    index
    render :index
  end




  private

  def video_params
    params.require(:video).permit(:title, :introduction, :genre_id, :prefecture_id, :price, :video).merge(user_id: current_user.id)
  end
end