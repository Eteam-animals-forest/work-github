class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_my_page_path(@customer), notice: "更新に成功しました."
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdraw
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
