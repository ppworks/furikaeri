class PusherAuthenticationsController < ApplicationController
  protect_from_forgery

  def create
    res = Pusher[params[:channel_name]].authenticate(
      params[:socket_id],
      project_key: params[:project_key]
    )
    render json: res
  end
end
