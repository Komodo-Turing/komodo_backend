class Api::V1::TimersController < ApplicationController
  def index
    render json: TimerSerializer.new(Timer.where(user_id: params[:user_id]))
  end

  def show
    render json: TimerSerializer.new(Timer.find(params[:id]))
  end

  def update
    render json: TimerSerializer.new(Timer.update(params[:id], timer_params))
  end

  private

  def timer_params
    params.permit(:user_id, :name, :duration, :substance, :dosage, :entry_instructions, :notes)
  end
end