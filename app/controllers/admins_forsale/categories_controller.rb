class AdminsForsale::CategoriesController < AdminsForsaleController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
      if @category.save()
        redirect_to admins_forsale_categories_path, notice: "Categoria cadastrada com sucesso!"
      else
        render :new
      end
  end

  def edit
  end

  def update  
    if @category.update(params_category)
      redirect_to admins_forsale_categories_path, notice: "Categoria atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to admins_forsale_categories_path, notice: "Categoria excluída com sucesso!"
    else
      render :index
    end
  end

  private

  def params_category
    params_category = params.require(:category).permit(:type)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
