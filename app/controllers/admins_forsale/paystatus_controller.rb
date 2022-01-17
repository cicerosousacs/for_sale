class AdminsForsale::PaystatusController < AdminsForsaleController
  before_action :set_paystatus, only: [:edit, :update, :destroy]

  def index
    @paystatuses = Paystatus.all
  end

  def new
    @paystatus = Paystatus.new
  end

  def create
    @paystatus = Paystatus.new(params_paystatus)
      if @paystatus.save()
        redirect_to admins_forsale_paystatus_path, notice: "Status de Pagamento cadastrado com sucesso!"
      else
        render :new
      end
  end

  def edit
  end

  def update  
    if @paystatus.update(params_paystatus)
      redirect_to admins_forsale_paystatus_path, notice: "Status de Pagamento atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @paystatus.destroy
      redirect_to admins_forsale_paystatus_path, notice: "Status de Pagamento excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def params_paystatus
    params_paystatus = params.require(:paystatus).permit(:type)
  end

  def set_paystatus
    @paystatus = Paystatus.find(params[:id])
  end
end
