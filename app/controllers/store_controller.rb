class StoreController < ApplicationController
  def index
    @products = Product.order(:title) #取到产品模型,并按标题排序
  end
end
