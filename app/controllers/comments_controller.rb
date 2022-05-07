class CommentsController < ApplicationController
  before_action :set_video, only: [:create]

  def create
    Comment.create(comment_params)
    redirect_to video_path(@video.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:value, :text).merge(user_id: current_user.id, video_id: params[:video_id],
                                                         profile_id: current_user.profile.id)
  end

  def set_video
    @video = Video.find(params[:video_id])
  end
end
