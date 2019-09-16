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
