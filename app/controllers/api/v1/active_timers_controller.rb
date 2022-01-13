class Api::V1::ActiveTimersController < ApplicationController
  def update
    render json: ActiveTimerSerializer.new(ActiveTimer.update(params[:id], active_timer_params))
  end

  def create
    new_timer = ActiveTimer.create!(active_timer_params)
    #image_url = MapsFacade.static_map(new_timer.address)
    TimerWorker.perform_async(new_timer.id, new_timer.user_id, new_timer.duration, new_timer.notes) #image_url
    render json: ActiveTimerSerializer.new(new_timer)
  end

  private

  def active_timer_params
    params.permit(:user_id, :name, :start_time, :duration, :substance, :dosage, :entry_instructions, :notes, :status, :address)
  end
end
