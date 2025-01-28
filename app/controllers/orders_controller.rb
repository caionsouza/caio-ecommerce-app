class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def success
    @order = Order.find(params[:id])
  end
end
