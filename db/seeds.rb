# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
Product.create!(
    title: 'HHKB Professional BT蓝牙版',
    description: 'HHKB Professional BT 白色有刻版 静电容键盘 蓝牙键盘 编程专用布局 60键',
    image_url: 'hhkb.jpg',
    price: 2188.00
)

Product.create!(
    title: 'Fashion Dress',
    description: 'PUMA Wen Liu',
    image_url: 'puma.jpg',
    price: 488.00
)

Product.create!(
    title: '【新】betu百图阿尔巴卡羊毛双面呢大衣女秋冬新款2019气质小个子毛呢外套1910T20 米杏色 S',
    description: '品牌： 百图（betu）
    商品名称：【新】betu百图阿尔巴卡羊毛双面呢大衣女秋冬新款2019气质小个子毛呢外套1910T20 米杏色 S
    商品编号：56611243217
    店铺： betu百图旗舰店商品
    毛重：1.0kg
    货号：1910T20
    版型：宽松型 厚度：厚款 领型：西装领
    流行元素：口袋 材质：羊毛呢衣 门襟：三粒扣
    适用年龄：25-29周岁 袖长：长袖 风格：通勤
    袖型：落肩袖 衣长：常规款 
    上市时间：2019年冬季',
    image_url: 'betu.jpg',
    price: 999.00
)
