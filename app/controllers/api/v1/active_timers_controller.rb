class Api::V1::ActiveTimersController < ApplicationController
  def update
    render json: ActiveTimerSerializer.new(ActiveTimer.update(params[:id], active_timer_params))
  end

  def create
    render json: ActiveTimerSerializer.new(ActiveTimer.create!(active_timer_params))
  end

  private

  def active_timer_params
    params.permit(:user_id, :name, :start_time, :duration, :substance, :dosage, :entry_instructions, :notes, :status)
  end
end