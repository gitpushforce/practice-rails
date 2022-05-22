require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest

    test 'render a list of products' do
        get products_path

        assert_response :success
        
        # product is the html class in the HTML file
        assert_select '.product', 2
    
    end

    test 'render a a detailed product page' do

        # ps4 is taken from test/fixtures/files/products.yml 
        # it can be used as (:ps4) and automatically will take the id
        get product_path(products(:ps4).id)
        assert_response :success
        assert_select '.title', 'PS4 slim'
        assert_select '.price', '150'
    end
end