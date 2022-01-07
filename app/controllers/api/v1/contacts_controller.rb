class Api::V1::ContactsController < ApplicationController
  def index
    render json: ContactSerializer.new(Contact.where(user_id: params[:user_id]))
  end 

  def create 
    contact = Contact.new(user_id: params[:user_id], name: params[:name], phone_number: params[:phone_number])
    if contact.save
      render json: ContactSerializer.new(contact)
    else
      render json: {error: 'Creation failed, check that all parameters are valid', status: 422}, status: 422
    end 
  end 

  def update 
    contact = Contact.find(params[:id])
    contact.update(phone_number: params[:phone_number])
    head :no_content
  end 

  def destroy 
    contact = Contact.find(params[:id])
    contact.destroy
    head :no_content
  end 
end