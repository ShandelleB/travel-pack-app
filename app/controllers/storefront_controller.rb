class StorefrontController < ApplicationController
  def all_items
    @products = Product.all
  end

  def items_by_category
    @category_name = params[:category]
    @products = Product.all
    @products_by_category = []
    
    @products.each do |product|
      if product.category == params[:category]
        @products_by_category.push(product)
      end
    end
  end
end
