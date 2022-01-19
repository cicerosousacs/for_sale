class AdminsForsale::WelcomeController < AdminsForsaleController
before_action :set_sale, only: [:edit, :update, :destroy]
  before_action :set_payment_options, only: [:new, :create, :edit, :update]
  before_action :set_paystatus_options, only: [:new, :create, :edit, :update]
  before_action :set_client_options, only: [:new, :create, :edit, :update]

  def index
    @sales = Sale.order(date: :desc).includes(:client, :payment, :paystatus).page(params[:page])
  end

  def new
    @sale = Sale.new
    @adproduct = Adproduct.new
  end

  def create
    @sale = Sale.new(params_sale)
      if @sale.save()
        redirect_to admins_forsale_sales_path, notice: "Vendas cadastrado com sucesso!"
      else
        render :new
      end
  end

  def edit
  end

  def update  
    if @sale.update(params_sale)
      redirect_to admins_forsale_sales_path, notice: "Vendas atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @sale.destroy
      redirect_to admins_forsale_sales_path, notice: "Vendas excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def params_sale
    params_sale = params.require(:sale).permit(:date, :client_id, :payment_id, :invoice, :paystatus_id, 
    adproducts_attributes: [:id, :product, :price, :_destroy] )
  end

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def set_payment_options
    @payment_options = Payment.all.pluck(:type, :id)
  end

  def set_paystatus_options
    @paystatus_options = Paystatus.all.pluck(:type, :id)
  end

  def set_client_options
    @client_options = Client.all.pluck(:name, :id,)
  end
end
