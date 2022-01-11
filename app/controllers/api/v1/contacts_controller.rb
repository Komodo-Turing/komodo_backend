class Api::V1::ContactsController < ApplicationController
  def index
    render json: ContactSerializer.new(Contact.where(user_id: params[:user_id]))
  end

  def show
    render json: ContactSerializer.new(Contact.find(params[:id]))
  end

  def create 
    contact = Contact.new(contacts_params)
    if contact.save
      render json: ContactSerializer.new(contact)
    else
      render json: {error: 'Creation failed, check that all parameters are valid', status: 422}, status: 422
    end 
  end 

  def update
    # contact = Contact.find(params[:id])
    # contact.update(contacts_params)
    # head :no_content
    render json: ContactSerializer.new(Contact.update(params[:id], contacts_params))
  end

  def destroy
    # contact = Contact.find(params[:id])
    # contact.destroy
    # head :no_content
    render json: ContactSerializer.new(Contact.destroy(params[:id]))
  end

  private 

  def contacts_params
    params.permit(:user_id, :name, :phone_number)
  end 
end