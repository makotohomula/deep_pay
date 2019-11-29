class Product < ApplicationRecord
    has_many :line_items  #一个产品可能是多个购物车里的商品

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
