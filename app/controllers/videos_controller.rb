class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_video, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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

  def show
    @order = Order.find(params[:id])
  end

  def edit
  end

  def update
    if @video.update(video_params)
      redirect_to video_path(@video.id)
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to root_path
  end

  def search
    index
    render :index
  end

  private

  def video_params
    params.require(:video).permit(:title, :introduction, :genre_id, :prefecture_id, :price,
                                  :video).merge(user_id: current_user.id, profile_id: current_user.profile.id)
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @video.user
  end
end
