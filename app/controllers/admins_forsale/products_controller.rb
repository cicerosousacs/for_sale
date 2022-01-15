class AdminsForsale::ProductsController < AdminsForsaleController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_category_options, only: [:new, :create, :edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params_product)
      if @product.save()
        redirect_to admins_forsale_products_path, notice: "Produto cadastrado com sucesso!"
      else
        render :new
      end
  end

  def edit
  end

  def update  
    if @product.update(params_product)
      redirect_to admins_forsale_products_path, notice: "Produto atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to admins_forsale_products_path, notice: "Produto excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def params_product
    params_product = params.require(:product).permit(:name, :description, :category_id, :stock, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category_options
    @category_options = Category.all.pluck(:type, :id)
  end
end