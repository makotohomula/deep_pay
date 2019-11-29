class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2  #精度为:8,即有8位有效数字; 小数点后保留两位

      t.timestamps
    end
  end
end
