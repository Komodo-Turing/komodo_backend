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
    require "pry"; binding.pry
    TwilioJob.set(wait: timer_duration.seconds).perform_later(ENV['MATT_PHONE_NUMBER'], 'Sent from the komodo_backend timer#create') #for testing i'm using seconds for the delay, but we can switch to minutes later; still need to abstract all of this and make the message dynamic.
  end

  def destroy
    render json: TimerSerializer.new(Timer.destroy(params[:id]))
  end

  private

  def timer_duration
    timer_params[:duration].to_i
  end

  def timer_params
    params.permit(:user_id, :name, :duration, :substance, :dosage, :entry_instructions, :notes)
  end
end
