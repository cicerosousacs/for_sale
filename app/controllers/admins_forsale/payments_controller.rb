class AdminsForsale::PaymentsController < AdminsForsaleController
  before_action :set_payment, only: [:edit, :update, :destroy]

  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(params_payment)
      if @payment.save()
        redirect_to admins_forsale_payments_path, notice: "Pagamento cadastrado com sucesso!"
      else
        render :new
      end
  end

  def edit
  end

  def update  
    if @payment.update(params_payment)
      redirect_to admins_forsale_payments_path, notice: "Pagamento atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @payment.destroy
      redirect_to admins_forsale_payments_path, notice: "Pagamento excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def params_payment
    params_payment = params.require(:payment).permit(:type)
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end
