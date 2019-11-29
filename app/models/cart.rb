class Cart < ApplicationRecord
    has_many :line_items, dependent: :destroy   #一个购物车中可以有多个商品,当购物车被删除时,购物车中的商品也应删除

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)   #当加入某产品时,先查看当前购物车
        if current_item #若存在该产品则数量+1
          current_item.quantity += 1
        else    #若不存在则在商品中新建该产品
          current_item = line_items.build(product_id: product.id)
        end
        current_item    #返回对象
    end

    def total_price
      line_items.to_a.sum { |item| item.total_price }
    end
end
