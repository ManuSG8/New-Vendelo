class ProductsController < ApplicationController
    def index
        @products = Product.all.with_attached_photo # Con with_attached_photo evitamos las consultas extra a la hora de listar los productos
    end

    def show
        product # Metodo product definido mas abajo
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to products_path, notice: 'Tu producto se ha creado correctamente'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        product # Metodo product definido mas abajo
    end

    def update
        if product.update(product_params) # Metodo product definido mas abajo
            redirect_to products_path, notice: 'Tu producto se ha actualizado correctamente'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        product.destroy# Metodo product definido mas abajo

        redirect_to products_path, notice: 'Tu producto se ha eliminado correctamente', status: :see_other # Hay que cambiar el codigo de estado que devuelve el redirect_to
    end

    private

    def product_params # Funcion que recoge los parametros enviados en el formulario
        params.require(:product).permit(:title, :description, :price, :photo) # Le indicamos que tiene que coger el objeto 'product', y solo se guardaran esos parametros en la BD con permit()
    end

    def product # Funcion que busca el producto por el ID en la URL
        @product = Product.find(params[:id])
    end
end
