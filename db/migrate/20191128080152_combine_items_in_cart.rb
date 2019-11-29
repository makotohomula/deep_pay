class CombineItemsInCart < ActiveRecord::Migration[5.0]
  def up
    #把购物车中同一产品的多个商品,合并为单个商品
    Cart.all.each do |cart| #对每个购物车操作
      #数据库中的group操作,按产品id分组,统计数量
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          #移除原有的商品项
          cart.line_items.where(product_id: product_id).delete_all

          # 生成新的商品项
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # 回滚操作,把那些数量大于1的商品项,重新分裂成数目为1的商品项
    LineItem.where("quantity>1").each do |line_item|
      #按数量生成新的商品项
      line_item.quantity.times do 
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end

      #移除原有的商品项
      line_item.destroy
    end
  end
end
