class AdminsForsale::ClientsController < AdminsForsaleController
  before_action :set_client, only: [:edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params_client)
      if @client.save()
        redirect_to admins_forsale_clients_path, notice: "Cliente cadastrado com sucesso!"
      else
        render :new
      end
  end

  def edit
  end

  def update  
    if @client.update(params_client)
      redirect_to admins_forsale_clients_path, notice: "Cliente atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @client.destroy
      redirect_to admins_forsale_clients_path, notice: "Cliente excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def params_client
    params_client = params.require(:client).permit(:name, :description, :category_id, :stock, :price)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
