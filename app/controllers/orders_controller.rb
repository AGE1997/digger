class OrdersController < ApplicationController
  before_action :set_video, only: [:new, :create]
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_video
    @video = Video.find(params[:video_id])
  end
  
  def order_params
    params.require(:order).permit(:prefecture_id).merge(user_id: current_user.id, profile_id: current_user.profile.id, video_id: params[:video_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @video.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end