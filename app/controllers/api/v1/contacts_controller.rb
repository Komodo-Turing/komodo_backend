class Api::V1::ContactsController < ApplicationController
  def index 
    render json: ContactSerializer.new(Contact.where(user_id: params[:user_id]))
  end 

  def create 
  end 

  def update 
  end 

  def destroy 
  end 
end