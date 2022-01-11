class Api::V1::ActiveTimersController < ApplicationController
  def update
    render json: ActiveTimerSerializer.new(ActiveTimer.update(params[:id], active_timer_params))
  end

  def create
    new_timer = ActiveTimer.create!(active_timer_params)
    # facade call to location 
    TimerWorker.perform_async(new_timer.id, new_timer.user_id, new_timer.duration, new_timer.notes) #need to combine params into one body message
    render json: ActiveTimerSerializer.new(new_timer)
  end

  private

  def active_timer_params
    params.permit(:user_id, :name, :start_time, :duration, :substance, :dosage, :entry_instructions, :notes, :status)
  end
end