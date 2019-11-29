require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do  #测试以 test <"测试未通过提示"> do 开头,以 end结尾
    product = Product.new
    assert product.invalid? #Product是一个空的模型,我们预期判断他是无效的
    assert product.errors[:title].any?  #接下来四句 assert 判断,认为在 product.errors 中相应属性下,应该有错误信息
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(title:       "My Book Title",
                          description: "yyy",
                          image_url:   "zzz.jpg")
    product.price = -1
    assert product.invalid? #预期断言无效
    assert_equal ["must be greater than or equal to 0.01"], #错误信息应该与该字符串匹配
      product.errors[:price]  

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], 
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)  #外置方法
    Product.new(title:       "My Book Title",
                description: "yyy",
                price:       1,
                image_url:   image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg 
             http://a.b.c/x/y/z/fred.gif }#使用字符串的快捷方式,生成多个字符串加入数组
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name| #使用循环减少代码量
      assert new_product(name).valid?, "#{name} shouldn't be invalid" #不匹配时输出的提示
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title:       products(:ruby).title, #利用与固件同名的方法,取出预先加载到测试数据库中的数据,实现同名
                          description: "yyy", 
                          price:       1, 
                          image_url:   "fred.gif")

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title:       products(:ruby).title,
                          description: "yyy", 
                          price:       1, 
                          image_url:   "fred.gif")

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
                 product.errors[:title]
  end
end
