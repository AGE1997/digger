class VideosController < ApplicationController
  def index
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




  def video_params
    params.require(:video).permit(:title, :introduction, :genre_id, :prefecture_id, :price, :video).merge(user_id: current_user.id)
  end
end