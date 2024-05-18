class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
     @address = Address.new(address_params)
     @address.customer_id = current_customer.id
     if @address.save
         redirect_to customers_addresses_path
     else
        @address = Address.new
        @addresses = current_customer._addresses
        render 'index'
     end
  end

  def destroy
     address = Address.find(params[:id])
     address.destroy
     redirect_to customers_addresses_path
  end 

  def edit
     @address = Address.find(params[:id])
  end

  def 
  end
end
