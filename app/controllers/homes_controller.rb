class HomesController < ApplicationController

  def index
    @videos = Video.includes(:user).order('created_at DESC')
  end
end
