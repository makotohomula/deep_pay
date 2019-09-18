require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end

    # unit test
    test "product attributes must not be empty" do
      product = Product.new
      assert product.invalid?
      assert product.errors[:title].any?
      assert product.errors[:description].any?
      assert product.errors[:price].any?
      assert product.errors[:image_url].any?
    end

    test "product price must be positive" do
      product = Product.new(title: 'My Book', 
                            description: 'my book',
                            image_url: 'test.jpg')
      product.price = -1
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

      product.price = 0
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]
      
      product.price = 1
      product.valid?
    end
    
    def new_product(image_url)
      product = Product.new(title: 'My Book', 
                            description: 'my book',
                            image_url: image_url,
                            price: 1)
    end
    
    test "image url" do
      ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
      bad = %w{fred.doc fred.gif.more}
      ok.each do |name|
        assert new_product(name).valid?, "#{name} is valid"
      end

      bad.each do |name|
        assert new_product(name).invalid?, "#{name} is invalid"
      end
    end
end
