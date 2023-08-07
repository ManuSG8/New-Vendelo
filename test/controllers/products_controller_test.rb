require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest    
    test 'render a list of products' do
        get products_path # products_path equivalente a '/products'

        assert_response :success
        assert_select '.product', 2 # Busca por la clase product que definimos en el index.html.erb
    end

    test 'render a detailed product page' do 
        get product_path(products(:ps4)) # Va a coger la fixture de ps4

        assert_response :success
        assert_select '.title', 'PS4 Fat'
        assert_select '.description', 'PS4 en buen estado'
        assert_select '.price', '150$'
    end
end