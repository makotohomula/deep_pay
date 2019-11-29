module CurrentCart
    private
  
      def set_cart 
        @cart = Cart.find(session[:cart_id])    #查找id,cookie用于客户端保存访问状态;session用于服务器端保存客户访问状态
      rescue ActiveRecord::RecordNotFound   #如果不存在则创建
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
end

