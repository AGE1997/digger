class CommentsController < ApplicationController
  before_action :set_video, only: [:create]

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to video_path(@video.id)
    else
      @comment = Comment.new
      @comments = @video.comments.includes(:user).order('created_at DESC')
      render template: 'videos/show'
    end
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
