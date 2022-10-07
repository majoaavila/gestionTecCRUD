require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { bar_code: @product.bar_code, batch: @product.batch, buying_price: @product.buying_price, category: @product.category, exp_date: @product.exp_date, name: @product.name, selling_price: @product.selling_price, supplier_id: @product.supplier_id, units: @product.units } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { bar_code: @product.bar_code, batch: @product.batch, buying_price: @product.buying_price, category: @product.category, exp_date: @product.exp_date, name: @product.name, selling_price: @product.selling_price, supplier_id: @product.supplier_id, units: @product.units } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
