class ProductsController < ApplicationController
    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end


    private

    def product_params # Funcion que recoge los parametros enviados en el formulario
        params.require(:product).permit(:title, :description, :price) # Le indicamos que tiene que coger el objeto 'product', y solo se guardaran esos parametros en la BD con permit()
    end
end
