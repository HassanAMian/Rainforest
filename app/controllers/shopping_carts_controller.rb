class ShoppingCartsController < ApplicationController
  before_filter :extract_shopping_cart

  def create
    @product = Product.find(params[:product_id])
    @shopping_cart.add(@product, (@product.price_in_cents.to_f/100))
    redirect_to shopping_cart_path
  end

  def show
  end

  def remove_item

    @product = Product.find(params[:product_id])

    @shopping_cart.remove(@product, 1)

    respond_to do |format|
      format.html { redirect_to shopping_cart_path }
      format.json { head :no_content }
    end
    
  end

  def update_quantity

    @product = Product.find(params[:product_id])

    @shopping_cart.add(@product, (@product.price_in_cents.to_f/100))

    respond_to do |format|
      format.html { redirect_to shopping_cart_path }
      format.json { head :no_content }
    end
  end

  private
  def extract_shopping_cart
    shopping_cart_id = session[:shopping_cart_id]
    @shopping_cart = session[:shopping_cart_id] ? ShoppingCart.find(shopping_cart_id) : ShoppingCart.create
    session[:shopping_cart_id] = @shopping_cart.id
  end
end