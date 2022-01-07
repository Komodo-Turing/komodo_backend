class Api::V1::ContactsController < ApplicationController
  def index
    render json: ContactSerializer.new(Contact.where(user_id: params[:user_id]))
  end 

  def create 
    render json: ContactSerializer.new(Contact.create(user_id: params[:user_id], name: params[:name], phone_number: params[:phone_number]))
  end 

  def update 
    contact = Contact.find(params[:id])
    contact.update(phone_number: params[:phone_number])
    head :no_content
  end 

  def destroy 
  end 
end