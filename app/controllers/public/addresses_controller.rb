class Public::AddressesController < ApplicationController
  def edit
    @address = Address.find(params[:id])
  end

  def create
     @address = Address.new(address_params)
     @address.customer_id = current_customer.id
    if @address.save
      flash[:success] = "新しい配送先の登録が完了しました。"
      redirect_to addresses_path(address_params)
    else
      @customer = current_customer
      @addresses = @customer.addresses
      flash[:danger] = "新しい配送先内容に不備があります。"
      render :index

    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
    redirect_to addresses_path
    else
       @addresses = Addresses.all
      render :index
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    @address.destroy
    flash[:success] = "配送先の削除が完了しました。"
    redirect_to addresses_path
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses

  end

    private
  def address_params
    params.require(:address).permit(:postcode, :addresses, :name)
  end


end
