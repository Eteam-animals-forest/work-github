class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses
    @customer = current_customer
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to public_addresses_path, notice: "住所が作成されました"
    else
      redirect_to public_addresses_path, alert: "住所の作成に失敗しました"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_addresses_path, notice: "住所が更新されました"
    else
      redirect_to edit_public_address_path(@address), alert: "住所の更新に失敗しました"
    end
  end

  def destroy
    address = Address.find(params[:id])
    if address.destroy
      redirect_to public_addresses_path, notice: "住所が削除されました"
    else
      redirect_to public_addresses_path, alert: "住所の削除に失敗しました"
    end
  end

  private

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end
