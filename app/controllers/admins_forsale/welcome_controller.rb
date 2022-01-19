class AdminsForsale::WelcomeController < AdminsForsaleController

  def index
    @sales = Sale.order(date: :desc).includes(:client, :payment, :paystatus).page(params[:page])
  end

end
