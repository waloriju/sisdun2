class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.string :sale_type      
      t.decimal :price, precision: 8, scale: 2
      t.integer :stock
      t.references :category

      t.timestamps
    end
    add_index :products, :category_id
  end
end
