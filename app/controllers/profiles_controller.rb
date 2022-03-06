class ProfilesController < ApplicationController

  def profile_params
    params.require(:profile).permit(:nickname, :sex_id, :genre_id, :prefecture_id, :birthday, :biography, :image).merge(user_id: current_user.id)
  end
end