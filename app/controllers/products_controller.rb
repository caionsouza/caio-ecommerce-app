class ProductsController < ApplicationController
  def index
    params.permit!
    @q = Product.ransack(search_params)
    @products = @q.result(distinct: true)

    if params[:sort].present?
      @products = case params[:sort]
                  when "name_asc"
                    @products.order(name: :asc)
                  when "name_desc"
                    @products.order(name: :desc)
                  when "price_asc"
                    @products.order(price: :asc)
                  when "price_desc"
                    @products.order(price: :desc)
                  else
                    @products
                  end
    end
  end

  def show
    @product = Product.find(params[:id])
    @cart = current_user.cart || current_user.build_cart  
  end
  
  private
    def search_params
      params.fetch(:q, {}).permit(:name_cont)
    end
end
