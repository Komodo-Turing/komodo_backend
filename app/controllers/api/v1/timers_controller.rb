class Api::V1::TimersController < ApplicationController
  def index
    render json: TimerSerializer.new(Timer.where(user_id: params[:user_id]))
  end

  def show
    render json: TimerSerializer.new(Timer.find(params[:id]))
  end
end