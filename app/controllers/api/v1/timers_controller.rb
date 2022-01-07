class Api::V1::TimersController < ApplicationController
  def index
    render json: TimerSerializer.new(Timer.where(user_id: params[:user_id]))
  end
end