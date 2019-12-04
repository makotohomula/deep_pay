class Product < ApplicationRecord
    has_many :line_items  #一个产品可能是多个购物车里的商品
    has_many :orders, through: :line_items  # 产品和订单模型不存在直接关系，即间接关系，一个产品有多个line_items，而每个line_items，都属于某个订单，通过line_items的关系来声明二者关系，可简化为这样的代码

    before_destroy :ensure_not_referenced_by_any_line_item  #在删除产品前,调用后面的方法

    validates :title, :description, :image_url, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :title, uniqueness: true
    validates :image_url, allow_blank: true, format: {
      with:    %r{\.(gif|jpg|png)\Z}i,  #不区分大小写
      message: 'must be a URL for GIF, JPG or PNG image.'
    }

    private

    # 删除某个产品时,应确保它不是某个购物车中的商品
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort  #抛出abort,记录不会被删除
      end
    end
end
