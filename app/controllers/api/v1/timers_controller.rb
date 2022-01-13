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

  def create
    render json: TimerSerializer.new(Timer.create!(timer_params))
  end

  def destroy
    render json: TimerSerializer.new(Timer.destroy(params[:id]))
  end

  private

  def timer_params
    params.permit(:id, :user_id, :name, :duration, :substance, :dosage, :entry_instructions, :notes)
  end
end