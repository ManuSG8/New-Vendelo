class ProductsController < ApplicationController
    def index
        @categories = Category.all.order(name: :asc).load_async # Con load_async hacemos que las query sean asincronas, asi no tienen que esperar a que se resuelva antes de pasara a la siguiente
        @products = Product.all.with_attached_photo.order(created_at: :desc).load_async # Con with_attached_photo evitamos las consultas extra a la hora de listar los productos

        # Filtrar por categorias
        if params[:category_id] # Si existe ese parametro en la URL, filtramos
            @products = @products.where(category_id: params[:category_id])
        end

        if params[:min_price].present? # Con present? comprobamos que el parametro tiene algun valor, porque puede ser que se envie vacio
            @products = @products.where('price >= ?', params[:min_price]) # El '?' es igual que una consulta preparada de PHP, le pasamos el min_price
        end
        if params[:max_price].present?
            @products = @products.where('price <= ?', params[:max_price]) 
        end
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
            redirect_to products_path, notice: t('.created')
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        product # Metodo product definido mas abajo
    end

    def update
        if product.update(product_params) # Metodo product definido mas abajo
            redirect_to products_path, notice: t('.updated')
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        product.destroy# Metodo product definido mas abajo

        redirect_to products_path, notice: t('.destroyed'), status: :see_other # Hay que cambiar el codigo de estado que devuelve el redirect_to
    end

    private

    def product_params # Funcion que recoge los parametros enviados en el formulario
        params.require(:product).permit(:title, :description, :price, :category_id, :photo) # Le indicamos que tiene que coger el objeto 'product', y solo se guardaran esos parametros en la BD con permit()
    end

    def product # Funcion que busca el producto por el ID en la URL
        @product = Product.find(params[:id])
    end
end
